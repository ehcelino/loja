class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :number
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :value, precision: 10, scale: 2
      t.decimal :delivery_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
