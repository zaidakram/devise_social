class DeviseSocial::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def passthru
    user = User.from_auth_hash(auth_hash)
    sign_in :user, user
    redirect_to after_sign_in_path_for(resource_name)
  end

  protected
    def auth_hash
      @auth_hash ||= (request.env['omniauth.auth'] || {})
    end
end
