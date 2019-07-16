class AdminProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
  end

  def create
    @product = Product.new
    @product.save
  end

  def show
  end

  def edit
    
  end

  def update
  end

  private
  def products_params
    params.require(:product).permit(:artist, :cd_title, :image, :notax_price, :label, :genre, :stock )
  end
end