class ProductsController < ApplicationController

  def new
    @product = Product.new
    @product.discs.build
    @product.songs.build
  end

  def index
    @products = Product.page(params[:page]).per(15)
    @q = Product.ransack(params[:q])
    @products = @search_products
    @product_randoms = Product.order("RANDOM()").limit(5)
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def show
    @product = Product.find(params[:id])
    @line_item = LineItem.new
  end


private
  def product_params
    params.require(:product).permit(:artist_id, :image, :label_id, :genre_id, :cd_title, :notax_price, :stock,
                                                         discs_attributes: [:id, :disc_num, :_destroy,
                                                         songs_attributes: [:id, :track_num, :song, :_destroy],] )
  end
end