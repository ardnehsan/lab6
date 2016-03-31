class User < ActiveRecord::Base
  has_many :posts
  has_secure_password
  validates :email, presence: true, uniqueness: true
  acts_as_followable
  acts_as_follower
end
