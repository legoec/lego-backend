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
require 'rails_helper'

RSpec.describe VendorRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
