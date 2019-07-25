class SellsController < ApplicationController


  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json

 def index
    @sells = Sell.all
  end


  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /produc
  def new
  @cart = current_cart
  if @cart.line_items.empty?
    redirect_to products_path, notice: 'カートは空です。'
    return
  end

  @sell = Sell.new

  respond_to do |format|
    format.html
    format.json { render json: @product }
  end
  end

  # GET /products/1/edit
  def edit
  end

  def create
    @sell = Sell.new(sell_params)
    @sell.add_items(current_cart)

    respond_to do |format|

      if @sell.save
  Cart.destroy(session[:cart_id])
  session[:cart_id] = nil
        format.html { redirect_to sells_finish_path, notice: 'ご注文ありがとうございました。' }
        format.json { render json: @sell, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /products/1
  # DELETE /products/1.json

  def destroy
    @product.destroy
    respond_to do |format|

      format.html { redirect_to products_path, notice: 'product was successfully destroyed.' }

      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:sip_name, :ship_address, :ship_tel, :pay)
    end
end