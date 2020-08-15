class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = User.ransack(params[:q])
    if current_user.try(:admin?)
      # @users = User.all.page(params[:page]).per(5)
      @users = @q.result(distinct: true).page(params[:page]).per(5)
    else
      @users = User.where(admin: true).page(params[:page]).per(5)
    end
  end
end
