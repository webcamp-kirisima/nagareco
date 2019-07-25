class SellsController < ApplicationController

before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @sells = Sell.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
  @cart = current_cart
  if @cart.line_items.empty?
    redirect_to products_path, notice: 'カートは空です。'
    return
  end

  @sell = Sell.new

  respond_to do |format|
    format.html
    format.json { render json: @order }
  end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @sell = Sell.new(sell_params)

    respond_to do |format|
      if @sell.save
        format.html { redirect_to @sell, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @sell }
      else
        format.html { render :new }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @sell.update(sell_params)
        format.html { redirect_to @sell, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @sell }
      else
        format.html { render :edit }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @sell.destroy
    respond_to do |format|
      format.html { redirect_to sells_url, notice: 'Order was successfully destroyed.' }
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
