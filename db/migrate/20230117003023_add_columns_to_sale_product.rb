class AddColumnsToSaleProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :sale_products, :sale_id, :integer
    add_column :sale_products, :product_id, :integer
    add_column :sale_products, :price, :decimal, precision: 10, scale: 2
    add_column :sale_products, :name, :string
    add_column :sale_products, :description, :string
    add_column :sale_products, :code, :string
    add_column :sale_products, :promo, :integer
  end
end
