class Admin::AdminController < Admin::BaseController
  
  def index
    @users = User.not_admin
    @clients = Client.all
  end
end
