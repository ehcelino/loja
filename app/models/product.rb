class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  has_and_belongs_to_many :shopping_carts
  has_many :line_items
  # attr_accessor :active
end
