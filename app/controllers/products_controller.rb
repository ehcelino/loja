class ProductsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_product
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_fk

  def new
    @product = Product.new
  end

  def index
    @products = Product.where("keywords LIKE ?", "%#{params[:search]}%").where(active: 1)
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
      return redirect_to admin_list_path
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

  def delete_image
    @product = Product.find(params[:id])
    @product.images[params[:image_index].to_i].purge
    redirect_to product_path(@product)
  end
  

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_list_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :code, :price, :active, :stock, :promo, :content, :keywords, :promo_price, images: [])
  end

  def invalid_product
    logger.error "Tentativa de acessar produto inválido #{params[:id]}"
    flash[:danger] = "Produto inválido ou inexistente."
    redirect_to root_url
  end

  def invalid_fk
    logger.error "Tentativa de excluir produto referenciado na tabela sale_products #{params[:id]}"
    flash[:danger] = "Erro: produto referenciado em vendas. Para retirá-lo da listagem, marque-o como inativo."
    redirect_to admin_list_url
  end

end
