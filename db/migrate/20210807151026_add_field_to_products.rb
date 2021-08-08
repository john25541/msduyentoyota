class AddFieldToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :year, :integer
    add_column :products, :transmission, :string
    add_column :products, :body_type, :string
    add_column :products, :seats, :integer
    add_column :products, :doors, :integer
    add_column :products, :colors, :integer
    add_column :products, :engine_size, :integer
    add_column :products, :fuel, :string
    add_column :products, :origin, :string
  end
end
