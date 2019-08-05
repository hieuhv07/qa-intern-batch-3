class Tag < ApplicationRecord
  has_many :tag_posts
  has_many :posts, through: :tag_posts
  belongs_to :user
end
