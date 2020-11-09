require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

describe "User visits theri show page" do
  context "if account has not been authenticated" do
      it "user authorizes account", :driver => :mechanize do
          user = User.create!(first_name: "michal",
                              last_name: "chojnacki",
                              email: "michal@gmail.com",
                              password: '12345')

          allow_any_instance_off(ApplicationController).to recive(:current_user).and_return(user)

          visit "/users/#{user.id}"

          expect(page).to have_link("Add to Account")
          expect(User.find(user.id).athlete_id).to be_nil
          expect(User.find(user.id).access_token).to be_nil

          click_on "Add Account"

          fill_in :email, with: ENV[TEST_ENVIRONMENT_EMAIL]
          fill_in :password, with: ENV[TEST_ENVIRONMENT_PASSWORD]

          click_button "Log In"

          click_button "Authorize"

          expect(current_path).to eq(user_path(user))
          expect(User.find(user.id).athlete_id).to be_truthy
          expect(User.find(user.id).access_token). to be_truthy
      end
  end
end
