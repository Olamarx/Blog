class PostsController < ApplicationController
  def index
 
    @posts = Post.includes(:author).where(author: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @current_user = current_user
    @ind_post = Post.includes(:author, comments: [:author]).find(params[:id])
  end

  def new
    @post = Post.new
    @current_user = current_user
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_posts_path(params[:user_id])
  end

  def create
    post = Post.new
    post.title = params[:user_posts][:title]
    post.text = params[:user_posts][:text]
    post.author = current_user

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
