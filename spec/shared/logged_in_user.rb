
shared_examples_for "logged in user" do
  before(:each) do
    @user = User.create(:login => "testi", :email => "test@test.test", :password => "password", :password_confirmation => "password")
    @user_session = UserSession.create(:user_id => @user.id)
  end
end
