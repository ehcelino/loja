class AddFieldsToSale < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :username, :string
    add_column :sales, :fullname, :string
    add_column :sales, :email, :string
    add_column :sales, :address, :string
    add_column :sales, :city, :string
    add_column :sales, :zip, :string
    add_column :sales, :sale_time, :datetime
  end
end
