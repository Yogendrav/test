class OrdersController < ApplicationController
  def index
    @search  = Order.search(params[:search])
    @orders = @search#paginate(:per_page => 10, :page => params[:client_page])
    @orders_today = Order.where("date(created_at) = ?", DateTime.now.to_date)
    @dateplusone = DateTime.now + 1.days

    respond_to do |format|
      format.html # index.html.erb
      format.xls
    end
  end

  def new
    @order = Order.new
    #1.times { @order.products.build }

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @contract }
    end
  end

  # GET /contracts/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
    @invoices = @order.invoices

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # POST /contracts
  # POST /contracts.json

  def create

    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, :notice => 'Narudzba je uspjesno kreiran.' }
        format.json { render :json => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Narudzba je uspjesno izmjenjena.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

end
