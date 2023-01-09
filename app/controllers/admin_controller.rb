class AdminController < ApplicationController
  before_action :authorize
  before_action :check_admin


  def list
    @products = Product.all
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, :notice => "Não autorizado."
    end
  end

end
