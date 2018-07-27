module AdminHelper
  def show_role(user)
    if user.enable?
      if user.user?
        link_to "Promote to manager", promote_to_manager_admin_admin_path(user), id: "refresh-btn", class: 'btn btn-xs green'
      else
        link_to "Demote to User", promote_to_manager_admin_admin_path(user), id: "refresh-btn", class: 'btn btn-xs red'
      end
    else
        link_to "User Disable", '#', id: "refresh-btn", class: 'btn btn-xs green'
    end
  end
  
  def show_status(user)
    if user.enable?
      link_to "Disable", change_status_admin_admin_path(user), id: "refresh-btn", class: 'btn btn-xs red'
    else
      link_to "Enable", change_status_admin_admin_path(user), id: "refresh-btn", class: 'btn btn-xs green'
    end
  end
end
