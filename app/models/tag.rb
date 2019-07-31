class Tag < ApplicationRecord
	has_many :tag_posts, class_name: TagPosts.name, dependent: :destroy
end
