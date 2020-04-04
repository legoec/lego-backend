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
class Service < ApplicationRecord
  begin :relationships
    belongs_to :vendor
    has_many :agreements
  end
end
