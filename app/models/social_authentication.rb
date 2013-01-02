class SocialAuthentication < ActiveRecord::Base
  belongs_to :authenticatable, polymorphic: true

  validates :provider, presence: true
  validates :uid, presence: true
end
