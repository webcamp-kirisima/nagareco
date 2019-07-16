class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :set_search

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_kana, :first_kana, :zip_code, :address, :tel])
  end

  def set_search
  	  @search = Product.ransack(params[:q])
  	  @search_products = @search.result.page(params[:page]).per(5)
  end
end
