# == Schema Information
#
# Table name: recomendations
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  contact     :string           not null
#  vendor_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Recomendation, type: :model do
  it { should_not allow_value(nil).for(:name) }
  it { should_not allow_value(nil).for(:contact) }
end
