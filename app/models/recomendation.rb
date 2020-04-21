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
class Recomendation < ApplicationRecord
  begin :relationships
    belongs_to :vendor
  end

  begin :validations
    validates :name, :contact, :vendor_id, presence: true
  end
end
