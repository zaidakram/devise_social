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

    it "creates and returns a new user if it does not exist" do
      expect {
        user = User.from_auth_hash(auth_hash)
        user.should be_persisted
      }.to change { User.count }.by(1)
    end

    it "returns an existing user if it exists" do
      User.from_auth_hash(auth_hash)

      expect {
        user = User.from_auth_hash(auth_hash)
        user.should be_persisted
      }.to_not change { User.count }
    end
  end
end
