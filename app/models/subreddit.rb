class Subreddit < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true,
                   format: { with: /^[A-Za-z0-9.&]*\z/, multiline: true},
                   length: { maximum: 21, minimum: 3},
                   uniqueness: { case_sensitive: false }
                   #  ^ validates there are no special characters
  validates :title, presence: true
end
