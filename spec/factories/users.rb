FactoryBot.define do
  factory :user do
    name                  { Faker::Name.name }
    nickname              { Faker::Internet.user_name }
    image                 { Faker::Avatar.image }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password }
    password_confirmation { password }
    admin                 { false }
  end

  trait :admin_user do
    admin { true }
  end
end
