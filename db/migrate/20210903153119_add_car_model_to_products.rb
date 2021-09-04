class AddCarModelToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :car_model, index: true, foreign_key: true
  end
end
