module ControllerHelpers
  def login_admin
    let(:user) { FactoryGirl.create(:admin) }
    before(:each) { sign_in user }
  end

  def login_user
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { sign_in user }
  end
end
