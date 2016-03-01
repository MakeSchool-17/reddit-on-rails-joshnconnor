require 'test_helper'

class SubredditTest < ActiveSupport::TestCase
  def setup
    @user = users(:josh)
    @subreddit = Subreddit.new(
                name: "sports",
                title: "stuff on sports",
                description: "a subreddit on sports",
                user_id: @user.id)
  end

  test "should be valid" do
    assert @subreddit.valid?
  end

  test "user_id sould be present" do
    @subreddit.user_id = nil
    assert_not @subreddit.valid?
  end

  test "title should be present" do
    @subreddit.title = "   "
    assert_not @subreddit.valid?
  end

  test "name should be present" do
    @subreddit.name = "   "
    assert_not @subreddit.valid?
  end
end
