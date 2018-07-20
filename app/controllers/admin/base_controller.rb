class Admin::BaseController < ApplicationController
  before_action :admin_required
  protected
  def admin_required
    redirect_to root_url, alert: 'You are not allowed to this section' unless current_user.admin?
  end
end
