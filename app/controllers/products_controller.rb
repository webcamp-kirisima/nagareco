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
  end

  def edit

  end

  def update
  end

  private
  def product_params
    params.require(:product).permit(:artist, :cd_title, :image, :notax_price, :label, :genre, :stock,
                                                         discs_attributes: [:id, :disc_num, :_destroy,
                                                          songs_attributes:[:id,:track_num, :_destroy]] )
  end
end