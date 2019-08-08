class Post < ApplicationRecord
  has_many :tag_posts, dependent: :destroy
  has_many :tags, through: :tag_posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: {minimum: 10}
  validates :content, presence: true, length: {minimum: 10}

  delegate :full_name, to: :user, prefix: true
  delegate :name, to: :category, prefix: true
end
