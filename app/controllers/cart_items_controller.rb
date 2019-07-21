class CartItemsController < ApplicationController
  def index
  	@products = Product.select_shop

    respond_to do |format|
    format.html
    format.json { render :xml => @product }
  end
  end

  def edit
  end

  def create
  end

  def delete
  end
end
