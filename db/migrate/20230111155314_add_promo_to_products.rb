class AddPromoToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :promo, :integer, default: 0
  end
end
