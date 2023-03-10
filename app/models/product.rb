class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  has_many :line_items
  # has_many :sale_products
  # has_many :sales, through: :sale_products
  # attr_accessor :active
  has_rich_text :content

  scope :active, -> { where(active: 1) }
  scope :nostock, -> { where(stock: 0) }
  # def update_quantity(product_id, quantity)
  #   product = Product.find_by(id: product_id)
  #   new_quantity = product.stock - quantity
  #   product.stock = new_quantity
  #   product.active = 0 if product.stock == 0
  #   product.save
  # end


end
