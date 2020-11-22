class TasksController < ApplicationController
  before_action :find_task, only:[:show, :edit, :update]
  def index    
    # 列出所有任務
    @tasks = Task.all
  end

  def show
    # 個別任務
  end

  def new
    # 新增任務
  end

  def create 
  end

  def edit

  end

  def update

  end

  def delete 

  end

  private
  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content)
  end

end
