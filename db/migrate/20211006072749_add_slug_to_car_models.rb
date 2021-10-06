class AddSlugToCarModels < ActiveRecord::Migration[6.1]
  def change
    add_column :car_models, :slug, :string
  end
end
