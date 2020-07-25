# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  percentage :float
#  active     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  icon       :string
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:vendors) }
end
