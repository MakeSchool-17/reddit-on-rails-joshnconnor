class AddSubredditToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :subreddit, index: true, foreign_key: true
  end
  add_index :posts, :subreddit_id
end
