class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    if product.promo?
      result = product.promo_price * quantity
    else
      result = product.price * quantity
    end
    result
  end
  
end
