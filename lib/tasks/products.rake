namespace :products do
  desc "inport data products from web"
  task inport_data: :environment do

  end

  def import(object)
    car_model = CarModel.create(name: object[:name], lowest_price: object[:lowest_price])
  end
end
