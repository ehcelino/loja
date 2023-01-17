class HomeController < ApplicationController

  def index

    if !cookies[:visited_index]
      cookies[:visited_index] = { value: true, expires: 1.week.from_now }
      @show_div = true
    else
      @show_div = false
    end
    
    @products = Product.where(active: 1)
    @images = []
    @links = []
    @info = []
    @products.each do |product|
      if product.active?
        @images.push(url_for(product.images[0]))
        @links.push(url_for(product))
        @info.push(product.name)
      end
    end
    # if session[:cart_id]
    #   @cart = Cart.find(session[:cart_id]) 
    # end
  end

  
end