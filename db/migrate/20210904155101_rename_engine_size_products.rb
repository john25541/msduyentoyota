class RenameEngineSizeProducts < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :engine_size, :cylinder_capacity
  end
end
