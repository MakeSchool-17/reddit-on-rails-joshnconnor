require 'test_helper'

class SubredditEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:josh)
    @subreddit = subreddits(:sports)
  end

  test "should not edit subreddit" do
    get edit_subreddit_path(@subreddit)
    assert_template 'subreddits/edit'
    patch subreddit_path(@subreddit), subreddit: {
                                      name: "   ",
                                      title: "   ",
                                      description: "yup" }
    assert_template 'subreddits/edit'
  end

  test "should edit subreddit" do
    get edit_subreddit_path(@subreddit)
    assert_template 'subreddits/edit'
    patch subreddit_path(@subreddit), subreddit: {
                                      name: "newsports",
                                      title: "new title",
                                      description: "yup",
                                      user_id: @user.id }
    follow_redirect!
    assert_template 'subreddits/show'
  end

end
