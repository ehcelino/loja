class ApplicationController < ActionController::Base
  before_action :have_shopping_cart
  before_action :my_cart
  protect_from_forgery

  def render_404
    render file: "#{Rails.root}/public/404.html", status: 404
  end

  def my_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id]) 
    end
  end

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
  
  def have_shopping_cart
    if current_user.nil?
      @shopping_cart = nil
    else
      @shopping_cart = current_user.shopping_cart
    end
  end
  # helper_method :have_shopping_cart

 end
