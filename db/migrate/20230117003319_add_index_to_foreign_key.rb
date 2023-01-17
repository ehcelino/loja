class AddIndexToForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_index :sale_products, :sale_id
    add_index :sale_products, :product_id
  end
end
