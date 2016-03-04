class Post < ActiveRecord::Base
  belongs_to :subreddit
  has_many :comments, dependent: :destroy
  validates :subreddit_id, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
end
