class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.all
    else
      @users = User.where(admin: true)
    end
  end
end
