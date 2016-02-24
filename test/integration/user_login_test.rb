require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "valid login" do
    get login_path
    assert_template "sessions/new"
    post login_path, session: {username: "test",
                               password: "password"}
  end
end
