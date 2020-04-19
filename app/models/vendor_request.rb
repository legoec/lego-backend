# == Schema Information
#
# Table name: vendor_requests
#
#  id         :bigint           not null, primary key
#  status     :string
#  feedback   :text
#  vendor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class VendorRequest < ApplicationRecord
  belongs_to :vendor
end
