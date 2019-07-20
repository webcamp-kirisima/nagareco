class AdminProductsController < ApplicationController
  def new
    @product = Product.new
    @product.discs.build
    @product.songs.build
  end

  def index
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
    params.require(:product).permit(:artist_id, :cd_title, :image_id, :notax_price, :label_id, :genre_id, :stock,
                                                         discs_attributes: [:id, :disc_num, :_destroy,
                                                          songs_attributes:[:id,:track_num, :_destroy]] )
  end
end
