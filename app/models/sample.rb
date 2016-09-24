class Sample < ActiveRecord::Base
end

# == Schema Information
#
# Table name: samples
#
#  id              :integer          not null, primary key
#  barcode         :string(255)
#  http_referrer   :string(255)
#  http_user_agent :string(255)
#  request_uri     :string(255)
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
