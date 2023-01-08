class HomeController < ApplicationController

  def index
    @products = Product.all
    @images = []
    @products.each do |product|
      @images.push(url_for(product.images[0]))
    end
  end

  def admin
    @products = Product.all
  end

end