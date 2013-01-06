# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auth_hash, class: OmniAuth::AuthHash do
    provider { Faker::Internet.domain_word }
    uid { Faker::Internet.user_name }
    info { FactoryGirl.create(:info_hash) }

    trait :facebook do
      provider 'facebook'
      info { FactoryGirl.create(:info_hash, :facebook) }
    end
  end
end
