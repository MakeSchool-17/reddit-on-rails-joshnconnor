require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    @validUser = {
            name: "trollboi",
            email: "troll@boi.com",
            password: "wordyword",
            password_confirmation: "wordyword"
            }
    @invalidUser = {
            name: "trollboi",
            email: "troll@boi.com",
            password: "wordy",
            password_confirmation: "word"
            }
  end

  test "get signup route" do
    get signup_path
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, user: @validUser
    end
    follow_redirect!
    assert_template 'users/show'
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: @invalidUser
    end
    assert_template 'users/new'
  end

end
