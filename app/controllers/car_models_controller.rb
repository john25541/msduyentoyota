class CarModelsController < ApplicationController
  def show
    @car_models = CarModel.all
  end
  private ####

  def car_model_params
    params.require(:car_model).permit(:name, :image)
  end
end
