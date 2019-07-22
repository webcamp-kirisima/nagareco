class ProductsController < ApplicationController

  def new
    @product = Product.new
    @product.discs.build
    @product.songs.build
  end

  def index
    @products = Product.page(params[:page]).per(5)
    @q = Product.ransack(params[:q])
    @products = @search_products
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def show
    @product = Product.find(params[:id])
  end


private
  def product_params
    params.require(:product).permit(:artist_id, :image, :label_id, :genre_id, :cd_title, :notax_price, :stock,
                                                         discs_attributes: [:id, :disc_num, :_destroy,
                                                         songs_attributes: [:id, :track_num, :song, :_destroy],] )
  end
end