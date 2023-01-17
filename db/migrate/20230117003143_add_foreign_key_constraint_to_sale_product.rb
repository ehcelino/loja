class AddForeignKeyConstraintToSaleProduct < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :sale_products, :sales, on_delete: :cascade
    add_foreign_key :sale_products, :products, on_delete: :nullify
  end
end
