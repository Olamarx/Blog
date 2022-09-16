class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'posts_id', inverse_of: 'posts'
  has_many :likes, foreign_key: 'posts_id', inverse_of: 'posts'

  after_save :update_counter

  def update_counter
    author.increment!(:postsCounter)
  end

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end
