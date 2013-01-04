# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auth_hash, class: OmniAuth::AuthHash do
    provider { Faker::Internet.domain_word }
    uid { Faker::Internet.user_name }
    info_hash
  end
end
