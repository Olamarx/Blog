class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def last_post
    posts.order(created_at: :desc).first
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def recent_posts
    posts.order(created_at: :desc).limit(5)
  end
end
