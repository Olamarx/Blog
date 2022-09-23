class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @ind_user = User.find(params[:id])
  end
end
