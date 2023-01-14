class CategoriesController < ApplicationController

  def show
    @products = Product.where(category_id: params[:id]).where(active: 1)
  end

  def promo
    @products = Product.where(promo: 1)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_category_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:category)
  end

end