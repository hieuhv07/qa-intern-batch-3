class Tag < ApplicationRecord
  has_many :tag_posts, class_name: TagPosts.name
  has_many :posts, through: :tag_posts
  belongs_to :user
end
