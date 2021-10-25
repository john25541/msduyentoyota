class DeleteYearFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :year, :integer
  end
end
