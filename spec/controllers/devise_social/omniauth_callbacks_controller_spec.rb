require 'spec_helper'

describe DeviseSocial::OmniauthCallbacksController do

  let(:omniauth_providers) { (1..3).map { Faker::Internet.domain_word } }
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  before :each do
    Devise.stub(:omniauth_providers).and_return(omniauth_providers)
    Rails.application.reload_routes!
  end

  describe "GET 'passthru'" do
    it "signs in user" do
      User.should_receive(:from_auth_hash).and_return(user)
      subject.should_receive(:sign_in).with(:user, user)
      get 'passthru', provider: omniauth_providers.first
      response.should redirect_to(controller.send(:after_sign_in_path_for, :user))
    end
  end

end
