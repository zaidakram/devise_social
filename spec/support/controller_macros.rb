module ControllerMacros
  def login_user
    before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)
    end
  end
end

RSpec.configure do |config|
  config.extend ControllerMacros, type: :controller
end
