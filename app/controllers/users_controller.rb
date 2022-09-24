class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @ind_user = User.find(params[:id])
    @current_user = current_user
  end
end
