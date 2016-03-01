require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:josh)
    @subreddit = subreddits(:sports)
    @subreddit[:user_id] = @user.id
    @post = @subreddit.posts.build(
                                    title: "Google wins the game",
                                    content: "We already knew that",
                                    user_id: @user.id
    )
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "title should be present" do
    @post.title = "   "
    assert_not @post.valid?
  end

  test "subreddit id should be present" do
    @post.subreddit_id = nil
    assert_not @post.valid?
  end
end
