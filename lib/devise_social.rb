require 'devise'
require 'devise_social/engine'

module DeviseSocial
  autoload :Mapping, 'devise_social/mapping'
end

Devise.add_module :social_authenticatable, model: true, controller: :omniauth_callbacks, route: :omniauth_callback
