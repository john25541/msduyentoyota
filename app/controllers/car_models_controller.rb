class CarModelsController < ApplicationController

  def show
    @car_model = CarModel.includes(:products).find_by_slug(params[:slug])
  end

  private

  def car_model_params
    params.require(:car_model).permit(:name, :image)
  end
end
