class LikesController < ApplicationController
  def create
    post = Post.find(params[:id])
    author = User.find(params[:author_id])
    like = Like.new
    like.post = post
    like.author = current_user

    respond_to do |format|
      format.html do
        if like.save
          flash[:success] = 'You successfully created a like'
        else
          flash[:error] = 'Like was not created. If you are the admin, learn to code well.'
        end
        redirect_to user_post_path(author, post)
      end
    end
  end
end
