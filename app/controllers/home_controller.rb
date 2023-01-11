class HomeController < ApplicationController

  def index
    @products = Product.where(active: 1)
    @images = []
    @links = []
    @products.each do |product|
      if product.active?
        @images.push(url_for(product.images[0]))
        @links.push(url_for(product))
      end
    end
    # if session[:cart_id]
    #   @cart = Cart.find(session[:cart_id]) 
    # end
  end

  
end