class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :allow_only_admin, only: [:index, :show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    redirect_to check_path if logged_in

    @user = User.new
  end

  def create
    @user = User.new(signup_params)
    @user.admin = false

    if @user.save
      flash.notice = 'Welcome! You can now sign in'
      redirect_to login_path
    else
      flash.alert = @user.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    par = update_params

    if par[:password].blank?
      par.delete(:password)
      par.delete(:password_confirmation)
    end

    par.delete(:admin) if current_user.id == @user.id

    puts 'PARAMSSSS'
    puts par

    if @user.update(par)
      flash.notice = 'User updated'
      redirect_to users_url
    else
      flash.alert = @user.errors.full_messages
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def protect
    unless is_admin
      flash.alert = 'You do not have access to this page'
      redirect_to root_url
    end
  end

  def update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def signup_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
