class AdminProductsController < ApplicationController
  def new
    @product = Product.new
    @disc = @product.discs.build
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
    params.require(:product).permit(:artist, :cd_title, :image, :notax_price, :label, :genre, :stock, :disc_num )
  end
end
