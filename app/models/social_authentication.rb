class SocialAuthentication < ActiveRecord::Base
  belongs_to :authenticatable, polymorphic: true

  validates :provider, presence: true
  validates :uid, presence: true

  class << self
    def from_auth_hash(auth_hash)
      params = ActionController::Parameters.new(auth_hash).permit(:provider, :uid)
      social_authentication = find_or_initialize_by(params)
      social_authentication.store_auth_hash(auth_hash)
      social_authentication.save
      social_authentication
    end
  end

  def store_auth_hash(auth_hash)
    self.token = auth_hash[:credentials][:token]
    self.expires_at = Time.at(auth_hash[:credentials][:expires_at])
  end
end
