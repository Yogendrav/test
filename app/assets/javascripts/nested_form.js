/*
jQuery(function($) {
  window.NestedFormEvents = function() {
    this.addFields = $.proxy(this.addFields, this);
    this.removeFields = $.proxy(this.removeFields, this);
  };

  NestedFormEvents.prototype = {
    addFields: function(e) {
      // Setup
      var link      = e.currentTarget;
      var assoc     = $(link).data('association');                // Name of child
      var blueprint = $('#' + $(link).data('blueprint-id'));
      var content   = blueprint.data('blueprint');                // Fields template

      // Make the context correct by replacing <parents> with the generated ID
      // of each of the parent objects
      var context = ($(link).closest('.fields').closestChild('input, textarea, select').eq(0).attr('name') || '').replace(new RegExp('\[[a-z_]+\]$'), '');

      // context will be something like this for a brand new form:
      // project[tasks_attributes][1255929127459][assignments_attributes][1255929128105]
      // or for an edit form:
      // project[tasks_attributes][0][assignments_attributes][1]
      if (context) {
        var parentNames = context.match(/[a-z_]+_attributes/g) || [];
        var parentIds   = context.match(/[0-9]+/g) || [];

        for(var i = 0; i < parentNames.length; i++) {
          if(parentIds[i]) {
            content = content.replace(
              new RegExp('(_' + parentNames[i] + ')_.+?_', 'g'),
              '$1_' + parentIds[i] + '_');

            content = content.replace(
              new RegExp('(\\[' + parentNames[i] + '\\])\\[.+?\\]', 'g'),
              '$1[' + parentIds[i] + ']');
          }
        }
      }

      // Make a unique ID for the new child
      var regexp  = new RegExp('new_' + assoc, 'g');
      var new_id  = new Date().getTime();
      content     = content.replace(regexp, new_id);

      var field = this.insertFields(content, assoc, link);
      // bubble up event upto document (through form)
      field
        .trigger({ type: 'nested:fieldAdded', field: field })
        .trigger({ type: 'nested:fieldAdded:' + assoc, field: field });
      return false;
    },
    insertFields: function(content, assoc, link) {
      return $(content).insertBefore(link);
    },
    removeFields: function(e) {
      var $link = $(e.currentTarget),
          assoc = $link.data('association'); // Name of child to be removed

      var hiddenField = $link.prev('input[type=hidden]');
      hiddenField.val('1');

      var field = $link.closest('.fields');
      field.hide();

      field
        .trigger({ type: 'nested:fieldRemoved', field: field })
        .trigger({ type: 'nested:fieldRemoved:' + assoc, field: field });
      return false;
    }
  };

  window.nestedFormEvents = new NestedFormEvents();
  $(document)
    .delegate('form a.add_nested_fields',    'click', nestedFormEvents.addFields)
    .delegate('form a.remove_nested_fields', 'click', nestedFormEvents.removeFields);
});

// http://plugins.jquery.com/project/closestChild
*/
/*
 * Copyright 2011, Tobias Lindig
 *
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *
 *//*

(function($) {
        $.fn.closestChild = function(selector) {
                // breadth first search for the first matched node
                if (selector && selector != '') {
                        var queue = [];
                        queue.push(this);
                        while(queue.length > 0) {
                                var node = queue.shift();
                                var children = node.children();
                                for(var i = 0; i < children.length; ++i) {
                                        var child = $(children[i]);
                                        if (child.is(selector)) {
                                                return child; //well, we found one
                                        }
                                        queue.push(child);
                                }
                        }
                }
                return $();//nothing found
        };
})(jQuery);
*/

jQuery(function($) {
    window.NestedFormEvents = function() {
        this.addFields = $.proxy(this.addFields, this);
        this.removeFields = $.proxy(this.removeFields, this);
    };

    NestedFormEvents.prototype = {
        addFields: function(e) {
            // Setup
            var link      = e.currentTarget;
            var assoc     = $(link).data('association');                // Name of child
            var blueprint = $('#' + $(link).data('blueprint-id'));
            var content   = blueprint.data('blueprint');                // Fields template
            // Make the context correct by replacing <parents> with the generated ID
            // of each of the parent objects
            var context = ($(link).closest('.fields').closestChild('input, textarea, select').eq(0).attr('name') || '').replace(new RegExp('\[[a-z_]+\]$'), '');

            // context will be something like this for a brand new form:
            // project[tasks_attributes][1255929127459][assignments_attributes][1255929128105]
            // or for an edit form:
            // project[tasks_attributes][0][assignments_attributes][1]
            if (context) {
                var parentNames = context.match(/[a-z_]+_attributes/g) || [];
                var parentIds   = context.match(/[0-9]+/g) || [];

                for(var i = 0; i < parentNames.length; i++) {
                    if(parentIds[i]) {
                        content = content.replace(
                            new RegExp('(_' + parentNames[i] + ')_.+?_', 'g'),
                            '$1_' + parentIds[i] + '_');

                        content = content.replace(
                            new RegExp('(\\[' + parentNames[i] + '\\])\\[.+?\\]', 'g'),
                            '$1[' + parentIds[i] + ']');
                    }
                }
            }

            // Make a unique ID for the new child
            var regexp  = new RegExp('new_' + assoc, 'g');
            var new_id  = new Date().getTime();

            content     = content.replace(regexp, new_id);

            var field = this.insertFields(content, assoc, link);
            // bubble up event upto document (through form)
            field
                .trigger({ type: 'nested:fieldAdded', field: field })
                .trigger({ type: 'nested:fieldAdded:' + assoc, field: field });

            /*                                                      MOJ DIO KODA                                                    */

            var postotak = 0;

            function izracunajRUC(element, product_id){

                $.ajax({
                    url: '/get_price_on_select',
                    type: 'POST',
                    dataType: 'json',
                    data: {"product_id" : product_id},
                    success: function(data) {
                        window.postotak = (parseFloat(data.price_percentage) / 100);
                    }

                });

                var itemID = element.attr("id").replace("quantity", "");
                var itemID = itemID.replace(/_$/, "");

                var kolicina = $("#" + itemID + "_quantity").val();

                var prodajna_cijena = $("#" + itemID + "_selling_price").val();

                var product_price = $("#" + itemID + "_price").val();

                var razlika = (prodajna_cijena * kolicina) - (product_price * kolicina);

                var auctus_zarada = razlika * window.postotak;

                $("#" + itemID + "_difference_price").val(razlika.toFixed(2));

                $("#" + itemID + "_price_percentage").val(auctus_zarada.toFixed(2));
            }

            $('input[type=checkbox]').each(function(i){
                $(this).change(function(){

                    if($(this).is(':checked')){
                        $(this).closest('.fields').find(".prodajna-cijena").removeAttr('disabled');
                    } else {
                        $(this).closest('.fields').find(".prodajna-cijena").attr('disabled', 'disabled');
                    }
                });
            });


            $('.proizvod').change(function(){

                var proizvod_name = $(this).attr("id").replace("product_id", "");
                var proizvod_name = proizvod_name.replace(/_$/, "");

                var client_id = $('.client-select').val();
                var product_id = $(this).val();

                $.ajax({
                    url: '/get_price_on_select',
                    type: 'POST',
                    dataType: 'json',
                    data: {"product_id" : product_id},
                    success: function(data) {
                        $("#" + proizvod_name + "_price.product-price").val(data.purchase_price);
                        $('.kolicina').each(function(){
                            izracunajRUC($(this), product_id);
                        });
                    }

                });

                $.ajax({
                    url: "/get_selling_price_on_select",
                    type: 'POST',
                    dataType: 'json',
                    data: {"product_id" : product_id, "client_id" : client_id},
                    success: function(data) {
                        if(data == null){
                            $("#" + proizvod_name + "_selling_price.prodajna-cijena").val("Nema podataka");
                        } else {
                            $("#" + proizvod_name + "_selling_price.prodajna-cijena").val(data.selling_price);
                        }
                        $('.kolicina').each(function(){
                            izracunajRUC($(this), product_id);
                        });
                    }
                });


            });

            $('.client-select').change(function(){
                var proizvod_name = $(this).attr("id").replace("product_id", "");
                var proizvod_name = proizvod_name.replace(/_$/, "");

                var client_id = $(this).val();

                $('.proizvod').each(function(){

                    var product_id = $(this).val();

                    $.ajax({
                        url: '/get_price_on_select',
                        type: 'POST',
                        dataType: 'json',
                        data: {"product_id" : product_id},
                        success: function(data) {
                            if(data == null){
                                $(".product-price").val("Nema podataka");
                            } else {
                                $(".product-price").val(data.purchase_price);
                            }
                            $('.kolicina').each(function(){
                                izracunajRUC($(this), product_id);
                            });
                        }
                    });


                    $.ajax({
                        url: "/get_selling_price_on_select",
                        type: 'POST',
                        dataType: 'json',
                        data: {"product_id" : product_id, "client_id" : client_id},
                        success: function(data) {
                            console.log(data.selling_price);
                            if(data == null){
                                $("#" + proizvod_name + "_selling_price.prodajna-cijena").val("Nema podataka");
                            } else {
                                $("#" + proizvod_name + "_selling_price.prodajna-cijena").val(data.selling_price);
                            }
                            $('.kolicina').each(function(){
                                izracunajRUC($(this), product_id);
                            });
                        }
                    });
                });
            })



            $('.kolicina').keyup(function(){

                var product_id = $(this).closest('.fields').find('.proizvod').val();
                console.log("dadada" + product_id);
                izracunajRUC($(this), product_id);
            });

            /*                                                      MOJ DIO KODA                                                    */

            return false;
        },
        insertFields: function(content, assoc, link) {
            return $(content).insertBefore(link);
        },
        removeFields: function(e) {
            var $link = $(e.currentTarget),
                assoc = $link.data('association'); // Name of child to be removed

            var hiddenField = $link.prev('input[type=hidden]');
            hiddenField.val('1');

            var field = $link.closest('.fields');
            field.hide();

            field
                .trigger({ type: 'nested:fieldRemoved', field: field })
                .trigger({ type: 'nested:fieldRemoved:' + assoc, field: field });
            return false;
        }
    };

    window.nestedFormEvents = new NestedFormEvents();
    $(document)
        .delegate('form a.add_nested_fields',    'click', nestedFormEvents.addFields)
        .delegate('form a.remove_nested_fields', 'click', nestedFormEvents.removeFields);
});

// http://plugins.jquery.com/project/closestChild
/*
 * Copyright 2011, Tobias Lindig
 *
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *
 */
(function($) {
    $.fn.closestChild = function(selector) {
        // breadth first search for the first matched node
        if (selector && selector != '') {
            var queue = [];
            queue.push(this);
            while(queue.length > 0) {
                var node = queue.shift();
                var children = node.children();
                for(var i = 0; i < children.length; ++i) {
                    var child = $(children[i]);
                    if (child.is(selector)) {
                        return child; //well, we found one
                    }
                    queue.push(child);
                }
            }
        }
        return $();//nothing found
    };
})(jQuery);

