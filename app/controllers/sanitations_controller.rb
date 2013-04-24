class SanitationsController < ApplicationController
  # GET /sanitations
  # GET /sanitations.json
  def index
    @sanitations = Sanitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sanitations }
    end
  end

  # GET /sanitations/1
  # GET /sanitations/1.json
  def show
    @sanitation = Sanitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sanitation }
    end
  end

  # GET /sanitations/new
  # GET /sanitations/new.json
  def new
    @sanitation = Sanitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sanitation }
    end
  end

  # GET /sanitations/1/edit
  def edit
    @sanitation = Sanitation.find(params[:id])
    @sanitation_valid = Sanitation.where('last_sanitation_date  <= (NOW() - INTERVAL 90 DAY)')
    @sanitation_count = Sanitation.where('last_sanitation_date  <= (NOW() - INTERVAL 90 DAY)').count
  end

  # POST /sanitations
  # POST /sanitations.json
  def create
    @sanitation = Sanitation.new(params[:sanitation])

    respond_to do |format|
      if @sanitation.save
        format.html { redirect_to @sanitation, notice: 'Sanitation was successfully created.' }
        format.json { render json: @sanitation, status: :created, location: @sanitation }
      else
        format.html { render action: "new" }
        format.json { render json: @sanitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sanitations/1
  # PUT /sanitations/1.json
  def update
    @sanitation = Sanitation.find(params[:id])

    respond_to do |format|
      if @sanitation.update_attributes(params[:sanitation])
        format.html { redirect_to @sanitation, notice: 'Sanitation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sanitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sanitations/1
  # DELETE /sanitations/1.json
  def destroy
    @sanitation = Sanitation.find(params[:id])
    @sanitation.destroy

    respond_to do |format|
      format.html { redirect_to sanitations_url }
      format.json { head :no_content }
    end
  end

  def get_client_address
    @addresses = Address.where(client_id: params[:client_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @addresses}
      format.js # index.js.erb
    end
  end
  def expired_sanitations
    @sanitations = Sanitation.where('last_sanitation_date  <= (NOW() - INTERVAL 88 DAY)')

    respond_to do |format|
      format.html
    end
  end

  def sanitation_valid
    @sanitation = Sanitation.find(params[:id])

    @sanitation.update_attribute(:last_sanitation_date, (params[:date].to_date + 90).to_date)

    respond_to do |format|
      format.js
    end
  end
end
