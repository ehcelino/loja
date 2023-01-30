class AdminController < ApplicationController
  before_action :authorize
  before_action :check_admin


  def list
    @products = Product.all
  end

  def sales
    @sales = Sale.order(created_at: :desc)
  end

  private

  # def check_admin
  #   unless current_user.admin?
  #     flash[:danger] = "Não autorizado."
  #     redirect_to root_path
  #   end
  # end

end
