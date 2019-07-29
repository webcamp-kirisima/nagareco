class Admin::SellsController < ApplicationController
  def index
    @sells = Sell.page(params[:page]).per(5)
  end

  def show
      @sell = Sell.find(params[:id])
      @sell_detail = SellDetail.find(params[:id])
      @sell_details = SellDetail.where(sell_id: @sell.id)
  end

  def create
  end

  def update
    @sell = Sell.find(params[:id])
    @sell.update(sell_params)
    redirect_to admin_sells_path(@sell)
  end

  private
  def sell_params
    params.require(:sell).permit(:ship_l_name, :ship_f_name, :ship_code, :ship_address, :ship_tel, :pay, :ship_status)
  end

end
