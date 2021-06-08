class CreateCarModels < ActiveRecord::Migration[6.1]
  def change
    create_table :car_models do |t|
      t.string :name
      t.decimal :lowest_price

      t.timestamps
    end
  end
end
