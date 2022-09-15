class Like < ApplicationRecord
  belong_to :user
  belong_to :post

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
