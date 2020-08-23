class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy]

  def index
    @q = User.ransack(params[:q])
    if current_user.try(:admin?)
      @users = @q.result(distinct: true).page(params[:page]).per(5)
    else
      @users = User.where(admin: true).page(params[:page]).per(5)
    end
    @member_users = User.all
  end

  def show
    @users = User.joins(:application_documents).group("users.id").order("count(application_documents.id) desc").page(params[:page]).per(5)
    @chart = User.joins(:application_documents).group("users.name").count
    @tasks = User.joins(:application_documents)
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "ユーザーを削除しました！"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
