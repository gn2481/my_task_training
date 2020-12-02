class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  def index
    # 列出所有任務
    @tasks = Task.all
  end

  def show
    # 個別任務
  end

  def new
    # 新增任務
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: '任務新增成功！'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: '任務修改成功！'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: '任務刪除成功！'
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content)
  end
end
