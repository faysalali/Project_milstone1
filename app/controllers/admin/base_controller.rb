class Admin::BaseController < ApplicationController
  before_action :validate_admin
  
  protected
  def validate_admin
    redirect_to root_url, alert: 'You are not allowed to this section' unless current_user.admin?
  end
end
