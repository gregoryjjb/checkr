class ApplicationController < ActionController::Base
  include SessionsHelper

  skip_before_action :verify_authenticity_token

  def index
    redirect_to check_path if logged_in
  end
  
  def about
  end
end
