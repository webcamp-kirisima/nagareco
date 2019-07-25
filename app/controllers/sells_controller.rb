class SellsController < ApplicationController

  before_action :set_sell, only: [:show, :edit, :update, :destroy]

  def index
    @sells = Sell.all
  end

  def show
  end

  def new
    @cart = current_cart
    if @cart.line_items.empty?
       redirect_to products_path, notice: 'カートは空です。'
      return
    end

    @sell = Sell.new

    respond_to do |format|
      format.html
      format.json { render json: @sell }
    end
  end

  def create_conf
    @cart = current_cart
    @sell = Sell.new(sell_params)

    respond_to do |format|
      format.html
      format.json { render json: @sell }
    end
  end

  def create
    @sell = Sell.new(sell_params)

    respond_to do |format|
      if @sell.save
          Cart.destroy(session[:cart_id])
          session[:cart_id] = nil
          format.html { redirect_to sells_finish_path}
          format.json { render json: @sell, status: :created, location: @sell }
      else
          format.html { redirect_to products_path }
          format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @sell.update(sell_params)
        format.html { redirect_to @sell, notice: 'sell was successfully updated.' }
        format.json { render :show, status: :ok, location: @sell }
      else
        format.html { redirect_to products_path }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sell.destroy
    respond_to do |format|
      format.html { redirect_to sells_url, notice: 'sell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def finish
  end




  private

  def set_sell
      @sell = Sell.find(params[:id])
    end

  def sell_params
      params.require(:sell).permit( :user_id, :pay, :ship_address, :ship_tel, :ship_code, :ship_name, :total)
  end

end
