module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def select_role
    User.roles.keys.map {|role| [role.titleize,role]}
  end

  def link_to_toggle_user_subscription(user)
    if user.admin?
      link_to("Set User", admin_user_path(user, value: :user),
        method: :patch, remote: true, class: "btn info custom-set-role", id: "btn-set-#{user.id}")
    elsif user.user?
      link_to("Set Admin", admin_user_path(user, value: :admin),
        method: :patch, remote: true, class: "btn info custom-set-role", id: "btn-set-#{user.id}")
    end
  end
end
