# == Schema Information
#
# Table name: services
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :float
#  amount     :integer
#  vendor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Service, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
