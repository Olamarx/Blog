class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @author = current_user
    @like = Like.new(params.permit(:author, :post))
    @like.post = @post
    @like.author = @author

    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'You successfully created a like'
        else
          flash[:error] = 'Like was not created. If you are the admin, learn to code well.'
        end
      end
    end
  end
end
