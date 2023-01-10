class ProductsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_product

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params.reject { |k| k["images"] })
      if product_params[:images].present?
        product_params[:images].each do |image|
          @product.images.attach(image)
        end
      end
      return redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :code, :price, images: [])
  end

  def invalid_product
    logger.error "Tentativa de acessar produto inválido #{params[:id]}"
    redirect_to root_url, notice: "Produto inválido ou inexistente."
  end

end
