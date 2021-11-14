class ApplicationController < ActionController::Base
  before_action :render_maintenance
  before_action :set_car_model

  TIME_MAINTENANCE = "Nov 20, 2021 12:00:00"

  protected

  def render_maintenance
    if Time.current < TIME_MAINTENANCE.to_time
      render :file => "#{Rails.root}/public/maintenance.html", :layout => false and return
    end
  end

  def set_car_model
    @car_models = CarModel.all
  end

  def after_sign_in_path_for(resource)
    admins_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end
end
