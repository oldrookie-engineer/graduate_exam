class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.try(:admin?)
      @users = User.all
    else
      @users = User.where(admin: true)
    end
  end
end
