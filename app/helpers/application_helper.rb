module ApplicationHelper
  APK_RELEASE_VERSION = "10.1"
  APK_RELEASE_FILENAME_PREFIX = "msco-release"
  
  def apk_download_filename
    [[APK_RELEASE_FILENAME_PREFIX, APK_RELEASE_VERSION].join("-"), 'apk'].join('.')
  end
end
