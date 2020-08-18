class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = User.ransack(params[:q])
    if current_user.try(:admin?)
      @users = @q.result(distinct: true).page(params[:page]).per(5)
    else
      @users = User.where(admin: true).page(params[:page]).per(5)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "ユーザーを削除しました！"
  end
end
