class ApplicationController < ActionController::Base
  before_action :set_car_model

  protected

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
