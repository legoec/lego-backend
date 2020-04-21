# == Schema Information
#
# Table name: services
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  price      :float            not null
#  amount     :integer
#  vendor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should have_many(:agreements) }
  it { should_not allow_value(nil).for(:name) }
  it { should_not allow_value(nil).for(:price) }
end
