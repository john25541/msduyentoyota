class CarModelsController < ApplicationController
  def show
  end
  private ####

  def car_model_params
    params.require(:car_model).permit(:name, :image)
  end
end
