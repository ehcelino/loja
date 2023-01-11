class ChangeActiveTypeOnProducts < ActiveRecord::Migration[7.0]
  def up
    change_column :products, :active, :integer, default: 1
  end
  def down
    change_column :products, :active, :boolean, default: true
  end
end
