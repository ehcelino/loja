class CategoriesController < ApplicationController

  def show
    @products = Product.where(category_id: params[:id]).where(active: 1)
  end

  def promo
    @products = Product.where(promo: 1)
  end

end