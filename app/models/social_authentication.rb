class SocialAuthentication < ActiveRecord::Base
  belongs_to :authenticatable, polymorphic: true

  validates :provider, presence: true
  validates :uid, presence: true

  class << self
    def from_auth_hash(auth_hash)
      social_authentication = find_or_initialize_by(provider: auth_hash[:provider], uid: auth_hash[:uid])
      social_authentication.store_auth_hash(auth_hash)
      social_authentication.save
      social_authentication
    end
  end

  def store_auth_hash(auth_hash)
  end
end
