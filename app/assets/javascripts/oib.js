$(function(){
	
	$('.oib').keyup(function(){

		var checked = CheckOIB($(this).val());

		if(2 == checked)
			$('.div-alert').html('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>OIB je prekratak</div>');
		else if(3 == checked)
			$('.div-alert').html('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>OIB je predugačak</div>');
		else if(4 == checked)
			$('.div-alert').html('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>OIB nije broj</div>');
		else if(checked)
			$('.div-alert').html('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">×</button>OIB je Točan</div>');
	});
})

function CheckOIB(oib) {
		
	oib = oib.toString();
	if (oib.length <= 10) 
		return 2;
	if (oib.length >= 12)
		return 3;
	var b = parseInt(oib, 10);
	if (isNaN(b))
		return 4;
	var a = 10;
	for (var i = 0; i < 10; i++) {
		a = a + parseInt(oib.substr(i, 1), 10);
		a = a % 10;
		if (a == 0)
			a = 10;
		a *= 2;
		a = a % 11;
	}
	var kontrolni = 11 - a;
	if (kontrolni == 10)
		kontrolni = 0;
	return kontrolni == parseInt(oib.substr(10, 1));
}