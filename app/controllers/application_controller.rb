class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :set_search
helper_method :current_cart
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_kana, :first_kana, :zip_code, :address, :tel])
  end

  def set_search
      @search = Product.ransack(params[:q])
      @search_products = @search.result.page(params[:page]).per(5)
  end

  protect_from_forgery with: :exception

  private
  def current_cart

    Cart.find(session[:cart_id])

    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
  end
end