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
class Recomendation < ApplicationRecord
  begin :relationships
    belongs_to :user
    belongs_to :service
  end

  begin :validations
    validates :description, :user_id, :service_id, presence: true
  end
end
