require 'test_helper'

class SubredditsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:test_post)
    @user = users(:josh)
    # @postSubreddit = {name: "frolf", title: "frat golf"}
    @subreddit = subreddits(:sports)
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
    assert_difference('Subreddit.count') do
      session[:user_id] = @user.id
      post :create, subreddit: { name: "frolf", title: "frat golf"}
    end
    assert_redirected_to subreddit_path(assigns(:subreddit))
  end

  test "should get show" do
    get :show, id: @subreddit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subreddit
    assert_response :success
  end

  test "should edit subreddit" do
    patch :update, id: @subreddit, subreddit: {
      name: 'some name',
      title: 'some title',
      user_id: @user.id,
      description: 'some description'}

    assert_response :success
      # assert_redirected_to subreddit_path(assigns(:subreddit))
  end

end
