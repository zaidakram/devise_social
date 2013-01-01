class DeviseSocial::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  Devise.omniauth_providers.each do |omniauth_provider|
    define_method omniauth_provider do
      render text: 'Success'
    end
  end

  def failure
  end
end
