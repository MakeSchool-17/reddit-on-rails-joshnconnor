class Subreddit < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true,
                   length: { minimum: 3, maximum: 30 },
                   uniqueness: { case_sensitive: false },
                   format: { with: /^[A-Za-z0-9.&]*\z/,
                             multiline: true }
  # validates :name, presence: true,
  #                  uniqueness: { case_sensitive: false },
  #                  length: { maximum: 21,
  #                            too_long: "name must be less than %{count} characters",
  #                            minimum: 4,
  #                            too_short: "name must be at least %{count} characters" },
  #                  format: { with: "/^[a-zA-Z\d\s]*$/", multiline: true}
                   #^ validates there are no special characters
  validates :title, presence: true
end
