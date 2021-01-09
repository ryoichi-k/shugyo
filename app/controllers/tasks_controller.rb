class TasksController < ApplicationController
 
  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.user = current_user
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}を登録しました。」"
  end

  def edit
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}を削除しました。」"
  end

  private
  def task_params
    params.require(:task).permit(:name)
  end
                                 
end
