class SuppliersController < ApplicationController
  # GET /suppliers
  # GET /suppliers.json
  # before_filter :authenticate_user!
  #before_filter :authenticate_user!, :except => [:show, :index]
  def index
    if current_user.has_role? :admin
      #@clients = Client.search(params[:search])
      @info = Supplier.count
      @search = Supplier.search(params[:search])
      @suppliers = @search.paginate(:per_page => 10, :page => params[:supplier_page])
    else
      @search = current_user.search(params[:search])
      @suppliers = @search.paginate(:per_page => 10, :page => params[:page])
    end
    #@clients = Client.find_by_user_id(current_user.id)

    #@clients = params[:user_id] ? Client.where( :user_id => current_user.id ) : Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @suppliers }
    end
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
    @supplier = Supplier.find(params[:id])
    @products = Product.where(:supplier_id => @supplier.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @supplier }
    end
  end

  # GET /suppliers/new
  # GET /suppliers/new.json
  def new
    @supplier = Supplier.new
    1.times { @supplier.phones.build }
    1.times { @supplier.emails.build }
    1.times { @supplier.addresses.build }
    #@phone = Phone.new
    #@email = Email.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @supplier }
    end
  end

  # GET /suppliers/1/edit
  def edit
    @supplier = Supplier.find(params[:id])
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(params[:supplier])

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, :notice => 'Dobavljac je uspjesno kreiran.' }
        format.json { render :json => @supplier, :status => :created, :location => @supplier }
      else
        format.html { render :action => "new" }
        format.json { render :json => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suppliers/1
  # PUT /suppliers/1.json
  def update
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      if @supplier.update_attributes(params[:supplier])
        format.html { redirect_to @supplier, :notice => 'Dobavljac je uspjesno izmjenjen.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    
    respond_to do |format|
        format.html { redirect_to suppliers_url }
        format.json { head :no_content }
    end
  end
end
