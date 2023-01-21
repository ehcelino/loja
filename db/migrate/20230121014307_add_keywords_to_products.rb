class AddKeywordsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :keywords, :string
  end
end
