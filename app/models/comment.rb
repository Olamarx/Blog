class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :posts, class_name: 'Post'

  after_save :update_counter

  private

  def update_counter
    post.increment!(:commentsCounter)
  end
end
