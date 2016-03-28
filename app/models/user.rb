class User < ActiveRecord::Base
  has_many :posts
  acts_as_follower
  acts_as_followable

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
