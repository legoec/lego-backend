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
class Agreement < ApplicationRecord
  begin :relationships
    belongs_to :user
    belongs_to :service
  end

  begin :validations
    validates :name, :duration, :cost, :rating, :user_id, :service_id, presence: true
  end
end
