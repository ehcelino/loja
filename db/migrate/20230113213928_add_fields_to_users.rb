class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fullname, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
  end
end
