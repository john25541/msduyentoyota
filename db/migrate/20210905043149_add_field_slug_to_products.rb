class AddFieldSlugToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :slug, :string
  end
end
