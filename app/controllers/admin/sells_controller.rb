class Admin::SellsController < ApplicationController
  def index
    @sells = Sell.page(params[:page]).per(5)
  end

  def show
  end

  def update
  end

end
