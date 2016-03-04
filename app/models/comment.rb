class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, polymorphic: true
  has_many :children, as: :parent,
                      class_name: "Comment",
                      dependent: :destroy
  belongs_to :parent, class_name: "Comment"
  validates :content, presence: true
  validates :user_id, presence: true
  validates :parent_id, presence: true
  validates :parent_type, presence: true
end
