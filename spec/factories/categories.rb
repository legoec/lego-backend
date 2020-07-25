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
FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    percentage { Faker::Number.number(digits: 100) }
    active { true }
  end
end
