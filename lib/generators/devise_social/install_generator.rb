module DeviseSocial
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs Devise Social."

      def create_migrations
        rake "devise_social_engine:install:migrations"
      end
    end
  end
end
