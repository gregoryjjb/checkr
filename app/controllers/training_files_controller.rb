require 'digest'

class TrainingFilesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :allow_only_admin

  def index
    @training_files = TrainingFile.all
  end

  def new
    @training_file = TrainingFile.new
  end

  def create
    @training_file = current_user.training_files.new(upload_params)

    if @training_file.save
      flash.notice = 'File uploaded'
      redirect_to training_files_path
    else
      flash.notice = @training_file.errors.full_messages
      render 'new'
    end
  end

  def destroy
    f = TrainingFile.find(params[:id])
    f.destroy
    flash.notice = 'Deleted'
    redirect_to training_files_path
  end

  private

  def upload_params
    params.require(:training_file).permit(:file)
  end
end
