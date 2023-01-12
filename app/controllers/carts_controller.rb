class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  
  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
    @cart = Cart.find(params[:id]) 
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    flash[:info] = "Seu carrinho está vazio!"
    redirect_to root_url
  end

  def checkout
    @cart = Cart.find(params[:id]) 
  end


  def remove
    logger.debug "AQUI AQUI #{params[:cart_id]}"
    logger.debug "AQUI AQUI #{params[:product_id]}"
    if @cart.id == session[:cart_id]
      logger.debug "Cart id correto"
    else
      logger.debug "Cart id errado"
    end
    logger.debug "CERTO!" if params[:cart_id] == @cart.id
    product = Product.find(params[:product_id])
    # cart = Cart.find(params[:cart_id])
    @cart.remove_product(product)
    redirect_to cart_path(@cart)
  end

  def final
    @cart.line_items.each do |item|
      @cart.update_quantity(item.product_id, item.quantity)
    end
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error "Tentativa de acessar carrinho de compras inválido #{params[:id]}"
      flash[:danger] = "Carrinho inválido."
      redirect_to root_url
    end

end
