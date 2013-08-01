require 'devise/models'
require 'devise/omniauth'

module Devise
  module Models
    module SocialAuthenticatable
      extend ActiveSupport::Concern
      include Omniauthable

      def self.required_fields(klass)
        []
      end

      included do
        has_many :social_authentications, as: :authenticatable, dependent: :destroy

        attr_accessor :password_optional
        attr_accessor :email_optional
      end

      module ClassMethods
        include Omniauthable::ClassMethods

        def from_info_hash(info_hash)
          user = find_or_initialize_by(email: info_hash[:email], username: info_hash[:username])
          user.password_optional = true
          user.email_optional = true
          user.save
          user
        end

        def from_auth_hash(auth_hash)
          social_authentication = SocialAuthentication.from_auth_hash(auth_hash)

          if social_authentication.authenticatable.nil?
            social_authentication.authenticatable = from_info_hash(auth_hash[:info])
            social_authentication.save
          end

          social_authentication.authenticatable.store_info_hash(auth_hash[:info])
          social_authentication.authenticatable.save

          social_authentication.authenticatable
        end
      end

      def store_info_hash(info_hash)
      end

      protected
        def password_required?
          return false if password_optional
          super if defined?(super)
        end

        def email_required?
          return false if email_optional
          super if defined?(super)
        end
    end
  end
end
