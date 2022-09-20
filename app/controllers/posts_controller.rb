class PostsController < ApplicationController
  def index
    @posts = 'All content posted'
  end

  def show
    @ind_post = 'individual content'
  end
end
