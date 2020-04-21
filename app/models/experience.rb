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
class Experience < ApplicationRecord
  begin :relationships
    belongs_to :vendor
  end

  begin :validations
    validates :name, :start_date, :end_date, :vendor_id, presence: true
  end
end
