class Admin::AdminController < ApplicationController
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
  def promote_to_maneger
    @user_ = User.find(params[:id])
    if @user_.user?
      @user_.maneger!
      redirect_to admin_root_path
    else
      @user_.user!
      redirect_to admin_root_path
    end
  end
end
