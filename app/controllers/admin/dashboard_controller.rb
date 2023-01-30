class Admin::DashboardController < Admin::BaseController
  layout 'admin/base'

  def index
    @last_3_sales = Sale.order(created_at: :asc).last(3)
    @nostock = Product.nostock
  end


  def products
    @products = Product.all
  end

end