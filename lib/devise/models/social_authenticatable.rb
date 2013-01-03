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
      end

      module ClassMethods
        def from_auth_hash(auth_hash)
          new
        end
      end
    end
  end
end
