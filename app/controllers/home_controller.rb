class HomeController < ApplicationController
protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
