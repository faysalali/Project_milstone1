module AdminHelper
  def show_role(user)
    return if user.disable?

    name, classes = user.user? ? ['Promote to manager', 'btn-primary'] : ['Demote to User', 'btn-danger']
    link_to name, update_role_admin_user_path(user), class: "btn btn-md #{classes}"
  end

  def show_status(user)
    name, classes = user.enable? ? ['User Enabled', 'btn-primary'] : ['User Disabled', 'btn-danger']
    link_to name, update_status_admin_user_path(user), class: "btn btn-md #{classes}"
  end
end
