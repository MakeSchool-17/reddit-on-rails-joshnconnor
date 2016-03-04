class Subreddit < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true,
                   format: { with: /^[a-zA-Z0-9]*$/, multiline: true},
                   length: { maximum: 21, minimum: 4},
                   uniqueness: { case_sensitive: false },
                   format: { with: /^[a-zA-Z0-9]*$/, multiline: true}
                   #  ^ validates there are no special characters
  validates :title, presence: true
end
