require 'spec_helper'

describe DeviseSocial::OmniauthCallbacksController do

  let(:omniauth_providers) { (1..3).map { Faker::Internet.domain_word } }

  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  before :each do
    Devise.stub(:omniauth_providers).and_return(omniauth_providers)
    Rails.application.reload_routes!
  end

  it "has an action for each provider" do
    omniauth_providers.each do |omniauth_provider|
      load "app/controllers/devise_social/omniauth_callbacks_controller.rb"
      get omniauth_provider
      response.should be_success
    end
  end

end
