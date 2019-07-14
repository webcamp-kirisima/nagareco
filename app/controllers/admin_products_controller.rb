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
end
