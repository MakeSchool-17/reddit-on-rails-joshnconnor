require 'test_helper'

class SubredditsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:test_post)
    @user = users(:josh)
    @subreddit = subreddits(:sports)
    @frolfy = subreddits(:frolfy)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subreddit" do
    assert_difference('Subreddit.count', 1) do
      session[:user_id] = @user.id
      post :create, subreddit: { name: "frolf", title: "frat golf"}
    end
    assert_redirected_to subreddit_path(assigns(:subreddit))
  end

  test "should create invalid subreddit" do
    session[:user_id] = @user.id
    assert_difference('Subreddit.count', 0) do
      post :create, subreddit: { name: '   ', title: '   '}
    end
    assert_template :new
    assert_not flash.empty?
  end

  test "should get show" do
    get :show, id: @subreddit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subreddit
    assert_response :success
  end

  test "should redirect edit when invalid subreddit" do
    patch :update, id: @subreddit, subreddit: {
      name: '   ',
      title: '   ',
      user_id: @user.id,
      description: 'some description'}

    assert_not flash.empty?
    # assert_redirected_to subreddit_path(assigns(:subreddit))
  end

  test "should destroy subreddit" do
    assert_difference('Subreddit.count', -1) do
      delete :destroy, id: @subreddit
    end
    assert_redirected_to r_all_path
  end

  test "should destroy subreddit, PAUSE NAWWWT" do
    assert_no_difference('Subreddit.count') do
      delete :destroy, id: @frolfy
    end
    assert_template :show, @frolfy
    assert_not flash.empty?
  end

end
