require 'spec_helper'

describe SocialAuthentication do
  subject { social_authentication }
  let(:social_authentication) { FactoryGirl.create(:social_authentication) }

  describe "associations" do
    it { should belong_to(:authenticatable) }
  end

  describe "columns" do
    it { should have_db_column(:type).of_type(:string) }
    it { should have_db_column(:authenticatable_type).of_type(:string) }
    it { should have_db_column(:authenticatable_id).of_type(:integer) }
    it { should have_db_column(:provider).of_type(:string) }
    it { should have_db_column(:uid).of_type(:string) }
    it { should have_db_column(:token).of_type(:string) }
    it { should have_db_column(:expires_at).of_type(:datetime) }

    it { should have_db_index(:type) }
    it { should have_db_index([:authenticatable_type, :authenticatable_id]) }
    it { should have_db_index([:provider, :uid]) }
  end

  describe "mass assignments" do
    it { should_not allow_mass_assignment_of(:type) }
    it { should_not allow_mass_assignment_of(:authenticatable_type) }
    it { should_not allow_mass_assignment_of(:authenticatable_id) }
    it { should_not allow_mass_assignment_of(:provider) }
    it { should_not allow_mass_assignment_of(:uid) }
    it { should_not allow_mass_assignment_of(:token) }
    it { should_not allow_mass_assignment_of(:expires_at) }
  end

  describe "validations" do
    it { should validate_presence_of(:provider) }
    it { should validate_presence_of(:uid) }
  end
end
