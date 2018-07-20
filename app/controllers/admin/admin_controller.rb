class Admin::AdminController < Admin::BaseController
  def index
    @user=User.all
  end
  def change_status
    @user = User.find(params[:id])
    if @user.disable? 
      @user.enable! 
      redirect_to admin_root_path
    else
      @user.disable!
      redirect_to admin_root_path
    end
  end
end
