class DownloadsController < ApplicationController

  def android
    send_file "#{Rails.root}/public/msco-prototype.apk", type: "Application/octet-stream"
  end

  def qr_code
    render layout: false
  end
end