class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end


  def create
    post = Post.find(params[:id])
    user = Post.find(params[:user_id])
    comment = Comment.new(params.require(:user_post_comments).permit(:text))
    comment.post = post
    comment.author = current_user


    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'You successfully created a comment'
        else
          flash[:error] = 'Comment was not created. If you are the admin, learn to code well.'
        end
        redirect_to user_post_path(user, post)
      end
    end
  end




end
