module Devise
  module Models
    module SocialAuthenticatable
      extend ActiveSupport::Concern
      include Omniauthable

      def self.required_fields(klass)
        []
      end

      included do
        has_many :social_authentications, as: :authenticatable

        attr_accessor :password_optional
        attr_accessor :email_optional
      end

      module ClassMethods
        include Omniauthable::ClassMethods

        def from_auth_hash(auth_hash)
          user = find_or_initialize_by_email(auth_hash[:info][:email])

          unless user.persisted?
            user.password_optional = true
            user.email_optional = true
            user.save
          end

          user
        end
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
