class ContractsController < ApplicationController
  # GET /contracts
  # GET /contracts.json
  def index

    @info = Contract.count
    #@contracts_coffee = Contract.
    #@contracts_water = @search.paginate(:per_page => 10, :page => params[:page])

    if current_user.has_role? :admin
      #@clients = Client.search(params[:search])
      # @join = Contract.first.products
      @search = Contract.search(params[:search])
      params.has_key?(:filter_product_id) ? @contracts = @search.where(product_id: params[:filter_product_id]).paginate(:per_page => 10, :page => params[:page]) : @contracts = @search.paginate(:per_page => 10, :page => params[:page])
    else
      @search = current_user.search(params[:search])
      @contracts = @search.paginate(:per_page => 10, :page => params[:page])
    end
    #@products = Product.find_by_product_code(current_user.id)

    #@clients = params[:user_id] ? Client.where( :user_id => current_user.id ) : Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contracts }
      format.js
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract = Contract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /contracts/new
  # GET /contracts/new.json
  def new
    @contract = Contract.new
    #1.times { @contract.product.build }
    1.times { @contract.sanitations.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contract }
    end
  end

  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(params[:contract])
    #@product = Product.find(params[:contract][:product_ids] ||= [])
    #@difference = @contract.selling_price - @product.purchase_price

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'Narudzba je uspjesno kreirana.' }
        format.json { render json: @contract, status: :created, location: @contract }
      else
        format.html { render action: "new" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.json
  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        format.html { redirect_to @contract, notice: 'Narudzba je uspjesno izmjenjena.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to contracts_url }
      format.json { head :no_content }
    end
  end

  def contract_valid
    @contract = Contract.find_by_id(params[:id])

    @contract.update_attribute(:valid_contract, params[:contract_state])

    respond_to do |format|
      format.js
    end
  end

  def get_selling_price_on_select
    @contracts = Contract.where(product_id: params[:product_id], client_id: params[:client_id]).first
    #render :partial => "contracts/product_price", :object => @products
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @contracts}
      format.js # index.js.erb
    end
  end
end
