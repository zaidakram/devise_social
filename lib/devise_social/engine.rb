module DeviseSocial
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.integration_tool :rspec
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    config.after_initialize do
      Devise::Mapping.send :include, DeviseSocial::Mapping
    end
  end
end
