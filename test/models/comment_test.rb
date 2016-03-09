require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:josh)
    @subreddit = subreddits(:sports)
    @subreddit[:user_id] = @user.id
    @post = posts(:test_post)
    @post[:subreddit_id] = @subreddit.id
    @post[:user_id] = @user.id
    @comment = @user.comments.build(
                                    content: "asdf",
                                    parent_id: @post.id,
                                    parent_type: "Post"
    )
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "content should be present" do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "post id should be present" do
    @comment.parent_id = nil
    assert_not @comment.valid?
  end
end
