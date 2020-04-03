# == Schema Information
#
# Table name: agreements
#
#  id         :bigint           not null, primary key
#  name       :string
#  duration   :integer
#  cost       :float
#  rating     :integer
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :bigint           not null
#
class Agreement < ApplicationRecord
  begin :relationships
    belongs_to :user
    belongs_to :service
  end
end
