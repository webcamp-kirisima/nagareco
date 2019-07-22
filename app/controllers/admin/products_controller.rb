class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.discs.build
    @product.songs.build
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end
  private

  def product_params
    params.require(:product).permit(:artist_id, :image, :label_id, :genre_id, :cd_title, :notax_price, :stock,
                                                         discs_attributes: [:id, :disc_num, :_destroy,
                                                         songs_attributes: [:id, :track_num, :song, :_destroy],] )
  end
end
