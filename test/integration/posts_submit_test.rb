require 'test_helper'

class PostsSubmitTest < ActionDispatch::IntegrationTest


    def setup
      @user = users(:josh)
    end

  test "create valid post (with title and user_id)" do
    log_in_as(@user)
    get submit_path
    assert_difference 'Post.count', 1 do
      post posts_path, post: { title: "content" }
    end
    follow_redirect!
    assert_template 'posts/show'
  end

  test "create invalid post (without title)" do
    log_in_as(@user)
    get submit_path
    assert_difference 'Post.count', 0 do
      post posts_path, post: { title: "" }
    end
    assert_template 'posts/new'
  end
end
