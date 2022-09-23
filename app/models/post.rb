class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_counter

  def recent_comments
    Comment.where(post: self).order(created_at: :desc).first(5)
  end

  private

  def update_counter
    author.increment!(:posts_counter)
  end
end
