class SellsController < ApplicationController

  def new
      @sell = Sell.new
  end 

   def create_confirm
      @sell = Sell.new
  end

  def create
      def create
      @sell = Sell.new
      @sell_details = SellDetail.new
      @sell_details.product_id = cart.item_id
  end
  end

  def show
  end

  def index
  end

  def finished
  end

  private

  def sell_params
      params.require(:sell).permit( :user_id, :pay, :ship_address, :ship_tel, :ship_code, :ship_name, :total)
  end

end
