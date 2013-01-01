module DeviseSocial
  module Mapping
    def self.included(base)
      base.alias_method_chain :default_controllers, :social
    end

    private
      def default_controllers_with_social(options)
        options[:controllers] ||= {}
        options[:controllers][:omniauth_callbacks] ||= 'devise_social/omniauth_callbacks'
        default_controllers_without_social(options)
      end
  end
end
