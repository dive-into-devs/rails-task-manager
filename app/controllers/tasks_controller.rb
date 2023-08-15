class TasksController < ApplicationController
  # before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(premited_params)
    @task.save
    redirect_to tasks_path(@tasks)
  end

def completed!
task.completed = true
end

  def update
    # raise
    @task = Task.find(params[:id])
    @task.update(premited_params)
    redirect_to tasks_path(@tasks)
  end


  def show
    @task = Task.find(params[:id])
  end

  def destroy
    # raise
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path(@tasks), status: :see_other
  # No need for app/views/restaurants/destroy.html.erb
  end

  private

  def premited_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
