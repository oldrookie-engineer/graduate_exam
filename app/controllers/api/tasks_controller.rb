module Api
  class TasksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_task, only: [:show, :update, :destroy]

    def index
      @tasks = Task.order('created_at ASC')
    end

    def create
      @task = Task.new(task_params)
      if @task.save
        render json: @task, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    def show
    end

    def update
    end

    def destroy
      @task.destroy!
    end

    private
    def task_params
      params.require(:task).permit(:title, :content)
    end

    def set_task
      @task = Task.find(params[:id])
    end
  end
end
