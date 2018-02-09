require 'barby'
require 'barby/barcode/qr_code'
require 'barby/outputter/png_outputter'
require 'barby/outputter/svg_outputter'

class DownloadsController < ApplicationController
  include ApplicationHelper

  before_action :get_apk_filename

  def android
    send_file "#{Rails.root}/public/apk/#{@apk_filename}", type: "Application/octet-stream"
  end

  def qr_code
    root_url = Rails.env.production? ? 'https://msco.herokuapp.com/' : 'http://localhost:3000'

    if File.exists?("#{Rails.root}/public/apk/#{@apk_filename}")
      @qr_code_file_name = "#{@apk_filename.split(".")[0]}.svg"
      apk_file_path = "#{root_url}/downloads/android?file=#{@apk_filename}"

      qr_code_obj = Barby::QrCode.new(apk_file_path)
      File.open("public/qr_code/#{@qr_code_file_name}", 'wb'){|f| f.write qr_code_obj.to_svg }
    else
      redirect_to qr_code_downloads_path
    end
  end

  def get_apk_filename
    @apk_filename = params[:file] ? params[:file] : apk_download_filename
  end
end