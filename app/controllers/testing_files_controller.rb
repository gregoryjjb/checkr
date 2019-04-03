require 'base64'

class TestingFilesController < ApplicationController
  def new
  end

  def create
    file = params[:test_file][:file]
    b64 = Base64.encode64(file.read)

    is_bad = false

    for bad in TrainingFile.all
      if b64.include? bad.bytes_sample
        is_bad = true
        break
      end
    end

    if is_bad
      flash.alert = "It's bad!"
    else
      flash.notice = "It's fine!"
    end

    render :new
  end
end
