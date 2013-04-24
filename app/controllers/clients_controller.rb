class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  # before_filter :authenticate_user!
  # before_filter :authenticate_user!, :except => [:show, :index]
  def index
    if current_user.has_role? :admin
      # @clients = Client.search(params[:search])
      @info = Client.count
      @search = Client.search(params[:search])
      @clients = @search.paginate(:per_page => 10, :page => params[:client_page])
    else
      @search = current_user.search(params[:search])
      @clients = @search.paginate(:per_page => 10, :page => params[:page])
    end
    #@clients = Client.find_by_user_id(current_user.id)

    #@clients = params[:user_id] ? Client.where( :user_id => current_user.id ) : Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    @contracts = Contract.where(:client_id => @client.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new
    1.times { @client.phones.build }
    1.times { @client.emails.build }
    1.times { @client.addresses.build }
    #@phone = Phone.new
    #@email = Email.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @client}
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save 
        format.html { redirect_to @client, :notice => 'Klijent je uspjesno kreiran.' }
        format.json { render :json => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.json { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, :notice => 'Klijent je uspjesno izmjenjen.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  def income_report

    #@invoices = Invoice.all
    unless params[:id] != "undefined"
      @invoices = Invoice.includes(:order).where('extract(month from orders.order_date) = ? AND extract(year from orders.order_date) = ?', params[:month], params[:year]) if params.has_key?(:month)
      @sum = Invoice.includes(:order).where('extract(month from orders.order_date) = ? AND extract(year from orders.order_date) = ?', params[:month], params[:year]).sum :selling_price  if params.has_key?(:month)
      @invoices = Invoice.includes(:order).where('extract(year from orders.order_date) = ?', params[:year]) if !params.has_key?(:half) && !params.has_key?(:quarter) && !params.has_key?(:month)
      @sum = Invoice.includes(:order).where('extract(year from orders.order_date) = ?', params[:year]).sum :selling_price if !params.has_key?(:half) && !params.has_key?(:quarter) && !params.has_key?(:month)
    else
      @invoices = Invoice.includes(:order).where('orders.client_id = ? AND extract(month from orders.order_date) = ? AND extract(year from orders.order_date) = ?', params[:id], params[:month], params[:year]) if params.has_key?(:month)
      @sum = Invoice.includes(:order).where('orders.client_id = ? AND extract(month from orders.order_date) = ? AND extract(year from orders.order_date) = ?', params[:id], params[:month], params[:year]).sum :selling_price if params.has_key?(:month)
      @invoices = Invoice.includes(:order).where('orders.client_id = ? AND extract(year from orders.order_date) = ?', params[:id], params[:year]) if !params.has_key?(:half) && !params.has_key?(:quarter) && !params.has_key?(:month)
      @sum = Invoice.includes(:order).where('orders.client_id = ? AND extract(year from orders.order_date) = ?', params[:id], params[:year]).sum :selling_price if !params.has_key?(:half) && !params.has_key?(:quarter) && !params.has_key?(:month)
    end
    #@payments = Payment.where('user_id = ? AND extract(year from payment_date) = ?', user_id, params[:year]).sum :points if !params.has_key?(:half) && !params.has_key?(:quarter) && !params.has_key?(:month)


    respond_to do |format|
      format.pdf do
        render :pdf => "file_name",
               #:orientation => 'Landscape',
               :template => 'reports/income_report.html.erb',
               :show_as_html => params[:debug].present?

      end
    end

  end
end
