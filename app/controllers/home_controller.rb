class HomeController < ApplicationController

  def index
    @products = Product.all
    @images = []
    @links = []
    @products.each do |product|
      @images.push(url_for(product.images[0]))
      @links.push(url_for(product))
    end
    # if session[:cart_id]
    #   @cart = Cart.find(session[:cart_id]) 
    # end
  end

  
end