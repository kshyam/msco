module AdminHelper
  def admin_active_class(link)
    controller_name == link ? 'active' : ''
  end
end