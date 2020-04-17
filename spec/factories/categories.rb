FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    percentage { Faker::Number.number(digits: 100) }
    active { true }
  end
end
