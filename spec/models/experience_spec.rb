# == Schema Information
#
# Table name: experiences
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  start_date  :datetime         not null
#  end_date    :datetime         not null
#  vendor_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Experience, type: :model do
  it { should_not allow_value(nil).for(:name) }
  it { should_not allow_value(nil).for(:start_date) }
  it { should_not allow_value(nil).for(:end_date) }
end
