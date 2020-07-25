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
class Category < ApplicationRecord
  begin :validations
    validates :name, :percentage, presence: true
  end
  begin :relationships
    has_many :vendors
  end
end
