class RemoveUserIdFromSale < ActiveRecord::Migration[7.0]
  def change
    remove_column :sales, :user_id, :bigint
  end
end
