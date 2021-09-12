class AddNameToAttachment < ActiveRecord::Migration[6.1]
  def change
    add_column :attachments, :name, :string
  end
end
