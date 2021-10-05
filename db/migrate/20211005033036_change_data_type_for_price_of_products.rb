class ChangeDataTypeForPriceOfProducts < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :price, :bigint
  end
end
