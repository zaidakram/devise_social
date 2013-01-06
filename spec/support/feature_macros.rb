module FeatureMacros
  include Warden::Test::Helpers
end

RSpec.configure do |config|
  config.include FeatureMacros, type: :feature
end
