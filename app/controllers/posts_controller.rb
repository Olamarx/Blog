class PostsController < ApplicationController
  def index
    @posts_in_pages = 2
    @user = User.find(params[:user_id])
    @page = params.fetch(:pag, 1)
    @posts = @user.posts[2 * (@page.to_i - 1), @posts_in_pages]
  end

  def show
    @ind_post = Post.find(params[:id])
  end
end
