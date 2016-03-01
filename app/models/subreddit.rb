class Subreddit < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true
  validates :title, presence: true
end
