class UsersController < ApplicationController

  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_fk

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      cookies[:auth_token] = @user.auth_token
      flash[:notice] = "Logado com sucesso."
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity, content_type: "text/html"
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:auth_token, :username, :email, :password, :admin, :fullname, :address, :city, :zip)
  end

  def invalid_fk
    logger.error "Tentativa de excluir usuário referenciado na tabela sale_products #{params[:id]}"
    flash[:danger] = "Erro: usuário referenciado em vendas. Para retirá-lo da listagem, marque-o como inativo."
    redirect_to admin_list_url
  end

end
