# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :info_hash, class: OmniAuth::AuthHash::InfoHash do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    trait :facebook do
    end
  end
end
