require 'base64'

class TestingFilesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :require_login

  def new; end

  def create
    file = upload_params[:file]
    b64 = Base64.encode64(file.read).gsub! '=', ''

    is_bad = false

    TrainingFile.all.each do |bad|
      if b64.include? bad.bytes_sample
        is_bad = true
        break
      end
    end

    @pass = !is_bad

    render :result
  end

  private

  def upload_params
    params.require(:test_file).permit(:file)
  end
end
