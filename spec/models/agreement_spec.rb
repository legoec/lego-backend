# == Schema Information
#
# Table name: agreements
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  duration   :integer          not null
#  cost       :float            not null
#  rating     :integer          not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :bigint           not null
#
require 'rails_helper'

RSpec.describe Agreement, type: :model do
  it { should_not allow_value(nil).for(:name) }
  it { should_not allow_value(nil).for(:duration) }
  it { should_not allow_value(nil).for(:cost) }
  it { should_not allow_value(nil).for(:rating) }
end
