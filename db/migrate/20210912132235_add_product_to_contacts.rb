class AddProductToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :product, :string
  end
end
