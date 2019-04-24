class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception

  def index
    redirect_to check_path if logged_in
  end
  
  def about
  end
end
