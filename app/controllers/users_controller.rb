class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show destroy]

  def index
    @q = User.ransack(params[:q])
    @users = if current_user.try(:admin?)
               @q.result(distinct: true).page(params[:page]).per(5)
             else
               User.where(admin: true).page(params[:page]).per(5)
             end
    @member_users = User.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @users = User.joins(:application_documents).group('users.id').order('count(application_documents.id) desc').page(params[:page]).per(5)
    @chart = User.joins(:application_documents).group('users.name').count
    @tasks = User.joins(:application_documents)
    @task_zeros = User.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'ユーザーを削除しました！'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
