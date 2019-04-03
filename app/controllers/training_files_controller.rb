require 'digest'

class TrainingFilesController < ApplicationController
  before_action :allow_only_admin

  def index
    @training_files = TrainingFile.all
  end
  
  def new
    @training_file = TrainingFile.new
  end

  def create
    @training_file = current_user.training_files.new(upload_params)
    #uploaded_file = params[:training_file][:file]

    #@training_file.content_hash = Digest::SHA256.hexdigest uploaded_file.read
    #@training_file.original_filename = uploaded_file.original_filename

    #@training_file.file_digest = 'This should not be here'

    puts @training_file

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
