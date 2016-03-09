require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:test_post)
    @user = users(:josh)
    @subreddit = subreddits(:sports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should create post" do
  #   assert_difference('Post.count') do
  #     post :create, post: {
  #       title: 'some title',
  #       link: 'http://www.link.com',
  #       user_id: @user.id,
  #       subreddit_id: @subreddit.id}
  #     end
  #   assert_redirected_to post_path(assigns(:post))
  # end


  test "should get show" do
    get(:show, id: @post)
    assert_response :success
  end

end
