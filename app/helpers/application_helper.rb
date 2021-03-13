module ApplicationHelper
  def side_bar_link_active(controller)
    current_page?(controller: controller) ? 'active' : ''
  end
end
