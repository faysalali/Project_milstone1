class Admin::AdminController < Admin::BaseController

  def index
    @users = User.search(params[:search], without: {role: 1})
    @clients = Client.all
  end
end
