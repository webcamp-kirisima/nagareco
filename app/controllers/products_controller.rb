class ProductsController < ApplicationController

  def new
    @product = Product.new
    @product.discs.build
    @product.songs.build
  end

  def index
  	@products =Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def show
  	@product = Product.find(params[:id])
  end


private
  def products_params
    params.require(:product).permit(:artist_id, :cd_title, :image, :notax_price, :label, :genre, :stock )
  end
end