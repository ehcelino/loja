class RemoveColumnsFromSaleProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :sale_products, :sale_id, :bigint
    remove_column :sale_products, :product_id, :bigint
  end
end
