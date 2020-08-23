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
  end

  def show
    # @q = User.ransack(params[:q])
    # @users = @q.result(distinct: true).joins(:application_documents).page(params[:page]).per(10)
    # @users = User.all.includes(:application_documents).page(params[:page]).per(10)
    @users = User.page(params[:page]).per(10)
    # @users = User.joins(:application_documents).group("application_documents").order("count_all DESC").count.page(params[:page]).per(10)
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
