class IntroduceController < ApplicationController
  def index
    @car_models = CarModel.all
  end
end
