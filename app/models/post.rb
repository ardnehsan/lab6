class Post < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true
  validates :user, presence: true
  paginates_per 5
  max_paginates_per 10
end
