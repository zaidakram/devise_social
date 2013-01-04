class SocialAuthentication < ActiveRecord::Base
  belongs_to :authenticatable, polymorphic: true

  validates :provider, presence: true
  validates :uid, presence: true

  class << self
    def from_auth_hash(auth_hash)
      social_authentication = find_or_initialize_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

      unless social_authentication.persisted?
        social_authentication.save
      end

      social_authentication
    end
  end
end
