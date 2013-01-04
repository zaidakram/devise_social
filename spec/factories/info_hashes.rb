# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :info_hash, class: OmniAuth::AuthHash::InfoHash do
    email { Faker::Internet.email }
  end
end
