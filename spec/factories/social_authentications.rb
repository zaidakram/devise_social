# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :social_authentication do
    provider { Faker::Internet.domain_word }
    uid { Faker::Internet.user_name }
    token { Faker::Lorem.characters(32) }
    expires_at { 1.day.from_now }

    trait :user do
      authenticatable { FactoryGirl.create(:user) }
    end

    trait :facebook do
      provider 'facebook'
    end
  end
end
