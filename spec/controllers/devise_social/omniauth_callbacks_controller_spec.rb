require 'spec_helper'

describe DeviseSocial::OmniauthCallbacksController do

  let(:omniauth_providers) { (1..3).map { Faker::Internet.domain_word } }
  let(:user) { FactoryGirl.create(:user) }
  let(:auth_hash) { FactoryGirl.create(:auth_hash) }

  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  context "with dummy omniauth providers" do
    before :each do
      Devise.stub(:omniauth_providers).and_return(omniauth_providers)
      load "app/controllers/devise_social/omniauth_callbacks_controller.rb"
      Rails.application.reload_routes!
    end

    after :all do
      Rails.application.reload_routes!
    end

    it "has an action for each provider" do
      omniauth_providers.each do |omniauth_provider|
        User.should_receive(:from_auth_hash).and_return(user)
        subject.should_receive(:sign_in).with(:user, user)
        get omniauth_provider
        response.should redirect_to(controller.send(:after_sign_in_path_for, :user))
      end
    end
  end

  describe "GET 'facebook'" do
    it "signs in and redirects user" do
      User.should_receive(:from_auth_hash).and_return(user)
      subject.should_receive(:sign_in).with(:user, user)
      get 'facebook', provider: 'facebook'
      response.should redirect_to(controller.send(:after_sign_in_path_for, :user))
    end
  end

end
