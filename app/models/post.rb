class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :subreddit
  validates :subreddit_id, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
end
