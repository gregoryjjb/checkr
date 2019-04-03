class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :allow_only_admin, only: [:index, :show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    if logged_in
      redirect_to users_url
    end

    @user = User.new
  end

  def create
    @user = User.new(signup_params)
    @user.admin = false

    if @user.save
      flash.notice = 'User created'
      redirect_to @user
    else
      flash.alert = @user.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    #if current_user.id == @user.id
    #  update_params.admin = true
    #end
    par = update_params

    if par[:password].blank?
      par.delete(:password)
      par.delete(:password_confirmation)
    end

    if current_user.id == @user.id
      par.delete(:admin)
    end

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
        flash.alert = "You do not have access to this page"
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
