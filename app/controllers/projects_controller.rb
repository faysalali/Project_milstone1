class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :mark_complete, :update]

  def index
    @projects = Project.search(params[:search])
    @project_ids = current_user.project_ids
  end

  def show
    @project = Project.includes(comments: :user).find params[:id]
    @comments = @project.comments
    @attachments = @project.attachments
  end

  def new
    @project = Project.new
    @project.attachments.build
  
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, success: "Project created successfully!"
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
      params.require(:project).permit(:title, :description, :price, :end_date, :status, :client_id, user_ids: [], attachments_attributes: [:id, :file, :_destroy])
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
