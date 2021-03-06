class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    redirect_to check_path if logged_in
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password])
      flash.notice = "Welcome back, #{user.name}!"
      log_in user
      redirect_to check_path
    else
      flash.alert = 'Invalid username/password'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
