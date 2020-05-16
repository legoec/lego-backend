# == Schema Information
#
# Table name: recomendations
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  service_id  :bigint           not null
#  user_id     :bigint           not null
#  ranking     :integer          default(0), not null
#
require 'rails_helper'

RSpec.describe Recomendation, type: :model do
  it { should_not allow_value(nil).for(:user_id) }
  it { should_not allow_value(nil).for(:service_id) }
end
