class UsersController < ApplicationController
  
  def index

    if current_user.has_role? :admin
      @users = User.all
    else
      @users = User.where(:superior => current_user.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @clients = Client.where(:user_id => @user.id)
    @suppliers = Supplier.where(:user_id => @user.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def new
  	@user = User.new
  	1.times { @user.user_phones.build }

  	respond_to do |format|
  	  format.html # new.html.erb
  	  format.json { render :json => @user}
  	end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save 
        format.html { redirect_to @user, :notice => 'Uspjesno ste kreirali suradnika.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

	def update
    @user = User.find(params[:id])

    password_changed = !params[:user][:password].empty?

    successfully_updated = if password_changed
      @user.update_with_password(params[:user])
    else
      @user.update_without_password(params[:user])
    end

    respond_to do |format|
	    if successfully_updated
	      format.html { redirect_to @user, :notice => 'Uspjesno sta azurirali suradnika.' }
	        format.json { head :no_content }
	    else
	      format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
	    end
	  end
  end
  

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to user_url }
      format.json { head :no_content }
    end
  end

end
