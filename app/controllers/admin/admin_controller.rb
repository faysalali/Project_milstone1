class Admin::AdminController < Admin::BaseController
  before_action :find_user_by_id, only: [:change_status, :promote_to_manager]
  def find_user_by_id
    @user = User.find(params[:id])
  end
  
  def index
    @user = User.notadmin
    @clients = Client.all
  end
  
  def change_status
    @user.enable_disable()
    redirect_to admin_root_path
  end
  
  def promote_to_manager
    @user.change_role()
    redirect_to admin_root_path
  end
end
