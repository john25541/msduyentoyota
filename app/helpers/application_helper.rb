module ApplicationHelper
    
  def is_active?(action)
    params[:controller] == action ? "active" : nil        
  end
  def body_class
    "#{controller_path.gsub('/', '_')} #{action_name} #{controller_name}-#{action_name} #{mobile_class}"
  end
  def mobile_class
    is_mobile? ? 'mobile' : ''
  end
  def is_mobile?
    request.user_agent =~ /Mobile|webOS/
  end
end
