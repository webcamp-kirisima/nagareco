class ProductsController < ApplicationController
  def index
   @products =Product.all
  end

  def show
  	@product = products.find(params[:id])
  end
end

private
  def products_params
    params.require(:product).permit(:artist_id, :cd_title, :image, :notax_price, :label, :genre, :stock )
  end

