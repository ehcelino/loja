class Sale < ApplicationRecord
  # belongs_to :user
  has_many :sale_products
  # has_many :products, through: :sale_products
end
