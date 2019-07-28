class SellsController < ApplicationController

  # GET /sells
  # GET /sells.json
  def index
    @sells = Sell.all
  end

  # GET /sells/1
  # GET /sells/1.json
  def show
  end

  # GET /sells/new
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to sells_path, notice: 'カートは空です。'
      return
    end

    @sell = Sell.new

  end

  def create_conf
      @sell = Sell.new(sell_params)
      @cart = current_cart
  end

  # GET /sells/1/edit
  def edit
  end

  def finish

  end
  # POST /sells
  # POST /sells.json
  def create
    @sell = Sell.new(sell_params)
    @cart = current_cart
    @sell.user_id = current_user.id

    
    if @sell.save
      @cart.line_items.each do |line_item|
        @sell_detail = SellDetail.new
        @sell_detail.sell_id = @sell.id
        @sell_detail.product_id = line_item.product_id
        @sell_detail.quantity = line_item.quantity
        @sell_detail.save
        line_item.destroy
      end

       redirect_to sells_finish_path
    else
      redirect_to new_sell_path
    end
  end

  # PATCH/PUT /sells/1
  # PATCH/PUT /sells/1.json
  def update
    respond_to do |format|
      if @sell.update(sell_params)
        format.html { redirect_to @sell, notice: 'sell was successfully updated.' }
        format.json { render :show, status: :ok, location: @sell }
      else
        format.html { render :edit }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sells/1
  # DELETE /sells/1.json
  def destroy
    @sell.destroy
    respond_to do |format|
      format.html { redirect_to sells_path, notice: 'sell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def sell_params
      params.require(:sell).permit(:ship_l_name, :ship_f_name, :ship_code, :ship_address, :ship_tel, :pay)
    end
end