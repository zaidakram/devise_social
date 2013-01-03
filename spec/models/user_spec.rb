require 'spec_helper'

describe User do
  subject { user }
  let(:user) { FactoryGirl.create(:user) }

  describe "associations" do
    it { should have_many(:social_authentications) }
  end

  describe "columns" do
  end

  describe "mass assignments" do
  end

  describe "validations" do
  end

  describe "#from_auth_hash" do
    let(:auth_hash) { FactoryGirl.create(:auth_hash) }

    it "returns user from auth_hash" do
      user = User.from_auth_hash(auth_hash)
      user.should_not be_nil
    end
  end
end
