require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:josh)
  end

  test "valid login" do
    get login_path
    assert_template "sessions/new"
    post login_path, session: {username: @user.username, password: "password"}
    assert is_logged_in?
  end

  test "invalid login" do
    get login_path
    assert_template "sessions/new"
    post login_path, session: {username: "lkasjdf", password: "asldkfj"}
    assert_template 'sessions/new'
  end

end
