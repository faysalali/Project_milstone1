class ProjectsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :mark_complete, :update]
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, success: "Client created successfully!"
    else
      render 'new'
    end
  end
  
  def update
    if @project.update(project_params)
      redirect_to projects_path, success: "Client updated successfully!"
    else
      render 'edit'
    end
  end
  
  def mark_complete
    @project.completed!
    redirect_to projects_path
  end
  
  private
  
  def project_params
    params.require(:project).permit(:title, :description, :price, :end_date, :status, :client_id, user_ids: [])
  end
  
  def set_user
    @project = Project.find(params[:id])
  end
  
end
