class User < ActiveRecord::Base
  acts_as_follower
  acts_as_followable


  has_many :posts
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
