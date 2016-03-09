class Post < ActiveRecord::Base
  belongs_to :subreddit
  belongs_to :user
  has_many :comments, as: :parent,
                      class_name: "Comment",
                      dependent: :destroy
  validates :subreddit_id, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates_format_of :link, with: URI::regexp(%w(http https)),
                             if: lambda { |post| post.link.present? }
end
