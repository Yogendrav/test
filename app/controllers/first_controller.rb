class FirstController < ApplicationController
	before_filter :authenticate_user!
	#before_filter :authenticate_user!, :except => [:show, :index]
	def index
		if current_user.has_role? :admin
	      #@clients = Client.search(params[:search])
        @info_not_valid = Contract.where(valid_contract: false).count
        @info_expired = Contract.where(['contract_end_date < ?', DateTime.now]).count
        @info_sanitation = Sanitation.where('last_sanitation_date  <= (NOW() - INTERVAL 88 DAY)').count
=begin
	      @info_cl = Client.count
	      @info_or = Contract.count
	      @info_su = Supplier.count
	      @info_pr = Product.count
=end
	      @search = Client.search(params[:search])
	      @clients = @search.paginate(:per_page => 5, :page => params[:client_page])
	      @search = Supplier.search(params[:search])
	      @suppliers = @search.paginate(:per_page => 5, :page => params[:supplier_page])
	    else
	      @search = current_user.search(params[:search])
	      @clients = @search.paginate(:per_page => 5, :page => params[:client_page])
	    end
	    #@clients = Client.find_by_user_id(current_user.id)

	    #@clients = params[:user_id] ? Client.where( :user_id => current_user.id ) : Client.all

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render :json => @first }
	    end
	end

	# def destroy_supplier
	# 	@supplier = Supplier.find(params[:id])
	# 	@supplier.destroy

	# 	respond_to do |format|
 #          format.html { redirect_to '/' }
 #          format.json { head :no_content }
 #    	end
 #    end

 #    def destroy_client
 #    	@client = Client.find(params[:id])
	#     @client.destroy

	#     respond_to do |format|
	#       format.html { redirect_to '/' }
	#       format.json { head :no_content }
 #    	end
 #    end
end
