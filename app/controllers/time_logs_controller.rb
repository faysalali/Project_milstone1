class TimeLogsController < ApplicationController
  before_action :set_project, only: [ :create, :new ]
  before_action :set_time_log, only: [ :edit, :update, :destroy ]
  before_action :validate_user, only: [ :edit, :update, :destroy ]

  def index
    @time_logs = TimeLog.includes(:user, :project).all
  end

  def new
    @time_log = TimeLog.new
  end

  def create
    @time_log = TimeLog.new(time_log_params)
    @time_log.project = @project
    @time_log.user = current_user
    @time_log.save
  end

  def edit
    @project = @time_log.project
  end

  def update
    @time_log.update(time_log_params)
  end

  def destroy
    @time_log.destroy
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def validate_user
      redirect_to time_logs_index_path(@project), alert: 'You are not Authorized to Perform this Action.' unless current_user.admin? || current_user.manager?
    end

    def time_log_params
      params.require(:time_log).permit(:hours, :project_id, :user_id)
    end

    def set_time_log
      @time_log = TimeLog.find params[:id]
    end
end
