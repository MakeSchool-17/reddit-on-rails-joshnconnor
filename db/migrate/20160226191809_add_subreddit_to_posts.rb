class AddSubredditToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :subreddit, index: true, foreign_key: true
  end
end
