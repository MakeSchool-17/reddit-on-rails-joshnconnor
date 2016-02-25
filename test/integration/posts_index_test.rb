require 'test_helper'

class PostsIndexTest < ActionDispatch::IntegrationTest

  test "index of posts including pagination" do
    get posts_path
    assert_template 'posts/index'
    first_page_of_posts = Post.paginate(page: 1)
    first_page_of_posts.each do |post|
      assert_select 'h1', text: post.title
    end
  end
end
