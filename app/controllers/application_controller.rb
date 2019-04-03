class ApplicationController < ActionController::Base
  include SessionsHelper

  def index
    redirect_to check_path if logged_in
  end
  
  def about
  end
end
