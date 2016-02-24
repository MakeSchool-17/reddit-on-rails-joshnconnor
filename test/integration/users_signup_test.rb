require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "get signup route" do
    get signup_path
    assert_template 'users/new'
  end

end
