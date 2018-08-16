class CommentsController < ApplicationController
  before_action :set_project
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :validate_user, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:new, :edit]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @project.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def edit
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
    redirect_to project_path(@project)
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def validate_user
      redirect_to project_path(@project), alert: 'You are not Authorized to Perform this Action.' unless current_user.id == @comment.user.id
    end

    def set_comment
      @comment = Comment.find params[:id]
    end
    
    def set_user
      @comments = @project.comments.includes(:user).last(5)
    end
end
