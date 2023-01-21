class AddPromoPriceToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :promo_price, :decimal, precision: 10, scale: 2
  end
end
