module ApplicationHelper
  APK_RELEASE_VERSION = "10.4"
  APK_RELEASE_FILENAME_PREFIX = "msco-release"
  MALL_NAME = 'Lifestyle' #'CCC'
  
  def apk_download_filename
    [[APK_RELEASE_FILENAME_PREFIX, APK_RELEASE_VERSION].join("-"), 'apk'].join('.')
  end
end
