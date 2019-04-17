require 'base64'

class TestingFilesController < ApplicationController
  def new
  end

  def create
    file = upload_params[:file]
    b64 = Base64.encode64(file.read)

    is_bad = false

    for bad in TrainingFile.all
      if b64.include? bad.bytes_sample
        is_bad = true
        break
      end
    end

    @pass = !is_bad

    render :result
  end

  def pass
    render 'Pass!'
  end

  def fail
    render 'Fail!'
  end

  private

  def upload_params
    params.require(:test_file).permit(:file)
  end
end
