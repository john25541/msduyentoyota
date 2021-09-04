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

  def car_model_for_product params_id
    car_model = CarModel.find_by_id(params_id)
    car_model&.name
  end
end
