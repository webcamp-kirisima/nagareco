class Admin::SellsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @sells = Sell.with_deleted.page(params[:page]).per(5)
  end

  def show
      @sell = Sell.with_deleted.find(params[:id])
      @sell_detail = SellDetail.with_deleted.find(params[:id])
      @sell_details = SellDetail.with_deleted.where(sell_id: @sell.id)
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
