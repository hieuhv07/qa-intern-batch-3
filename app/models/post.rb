class Post < ApplicationRecord
	has_many :tag_posts, class_name: TagPosts.name, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
end
