class User < ActiveRecord::Base
  has_secure_password
  # TODO
  # this will come out with devise
  # remove secure password from users model (ie password_digest)
  has_many :subreddits
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
