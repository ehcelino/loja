class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product, qtt=1)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += qtt
    else
      current_item = line_items.build(product_id: product.id)
      current_item.quantity = qtt
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def items_quantity
    line_items.to_a.sum { |item| item.quantity }
  end

  def item_quantity(product_id)
    line_items.each do |item|
      if item.product_id == product_id
        return item.quantity
      end
    end
  end

  def update_quantity(product_id, quantity)
    product = Product.find_by(id: product_id)
    new_quantity = product.stock - quantity
    product.stock = new_quantity
    product.active = 0 if product.stock == 0
    product.save
  end


  def delivery_price
    items_quantity * 10.0
  end

end
