class Admin::AdminController < Admin::BaseController
  before_action :set_user, only: [:update_status, :update_role]
  
  def index
    @users = User.not_admin
    @clients = Client.all
  end
  
  def update_status
    @user.update_status()
    redirect_to admin_root_path
  end
  
  def update_role
    @user.update_role()
    redirect_to admin_root_path
  end
  
  private
  
    def set_user
    @user = User.find(params[:id])
  end
end
