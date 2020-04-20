# == Schema Information
#
# Table name: vendor_requests
#
#  id         :bigint           not null, primary key
#  status     :string           not null
#  feedback   :text
#  vendor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe VendorRequest, type: :model do
  it { should_not allow_value(nil).for(:status) }
  it { should_not allow_value(nil).for(:vendor_id) }
end
