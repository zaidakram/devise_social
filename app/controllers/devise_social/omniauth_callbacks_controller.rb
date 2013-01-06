class DeviseSocial::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  Devise.omniauth_providers.each do |omniauth_provider|
    define_method omniauth_provider do
      resource_instance = resource_class.from_auth_hash(auth_hash)
      sign_in resource_name, resource_instance
      redirect_to after_sign_in_path_for(resource_name)
    end
  end

  protected
    def auth_hash
      @auth_hash ||= (request.env['omniauth.auth'] || {})
    end
end
