require 'spec_helper'
require 'faker'

describe "omniauth routing" do

  let(:omniauth_providers) { (1..3).map { Faker::Internet.domain_word } }

  before :each do
    Devise.stub(:omniauth_providers).and_return(omniauth_providers)
    Rails.application.reload_routes!
  end

  it "routes to omniauth providers" do
    omniauth_providers.each do |omniauth_provider|
      get(user_omniauth_callback_path(omniauth_provider)).should route_to(controller: 'devise_social/omniauth_callbacks', action: omniauth_provider)
    end
  end

end
