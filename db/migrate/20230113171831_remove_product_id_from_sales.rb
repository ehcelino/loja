class RemoveProductIdFromSales < ActiveRecord::Migration[7.0]
  def change
    remove_column :sales, :product_id, :integer
  end
end
