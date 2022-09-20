class UsersController < ApplicationController
  def index
    @users = 'All users'
  end

  def show
    @ind_user = 'individual user'
  end
end
