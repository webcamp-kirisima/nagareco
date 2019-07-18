class ProductsController < ApplicationController
  def index
   @products =Product.all
  end

  def show
  	@products = products.find(params[:id])
  end
end

private
  def products_params
    params.require(:product).permit(:artist, :cd_title, :image, :notax_price, :label, :genre, :stock )
  end
