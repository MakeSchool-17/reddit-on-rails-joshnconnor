require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:test_post)
    @user = users(:josh)
    @subreddit = subreddits(:sports)
  end

  test "should get new" do
    # get new_subreddit_post_path(:subreddit_id => @subreddit.id)
    get :new, subreddit_id: @subreddit.id
    assert_response :success
  end

  test "should create post" do
    # get :new, subreddit_id: @subreddit.id
    # assert_response :success
    assert_difference('Post.count') do
      session[:user_id] = @user.id
      post :create, subreddit_id: @subreddit, post: {
        title: 'some title',
        link: 'http://www.link.com'
      }
    end
    assert_redirected_to subreddit_post_path(@subreddit, assigns(:post))
  end


  test "should get show" do
    get :show, subreddit_id: @post.subreddit_id, id: @post
    assert_response :success
  end

end
