class PostsController < ApplicationController
  def index
    @current_user = current_user
    @posts_in_pages = 2
    @user = User.find(params[:user_id])
    @page = params.fetch(:page, 1)
    @posts = @user.posts[2 * (@page.to_i - 1), @posts_in_pages]
    # @post_id = Post.find(params[:post_id], @user.id)
  end

  def show
    @current_user = current_user
    @ind_post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @current_user = current_user 
    respond_to do |format|
    format.html { render :new, locals: {post: @post }}
    end
  end

  def create
    post = Post.new
    post.title = params[:user_posts][:title]
    post.text = params[:user_posts][:text]
    post.author = current_user
    post.comments_counter = 0
    post.likes_counter = 0

    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'A post has been successfully created'
          redirect_to user_path(current_user)
        else
          flash.now[:error] = 'Post failed to be saved'
          render :new, new_user_post_path(current_user)
        end
      end
    end
  end

  
end
