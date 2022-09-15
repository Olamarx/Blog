class Comment < ApplicationRecord
  belong_to :user
  belong_to :post

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
