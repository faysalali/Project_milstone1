module AdminHelper
  def user_status_class(user)
    user.disable? ? 'danger' : 'primary'
  end
  def user_role_class(user)
    user.manager? ? 'success' : 'primary'
  end

end
