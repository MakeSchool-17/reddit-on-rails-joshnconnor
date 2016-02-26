class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :subreddit
  validates :user_id, presence: true
  validates :title, presence: true
end
