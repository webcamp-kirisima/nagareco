class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

 
  def index
    @carts = Cart.all

  end

 
  def show
    @product_randoms = Product.order("RANDOM()").limit(3)
    @line_item = LineItem.new
  end

  def new
    @cart = Cart.new

  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_item
    @line_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy

    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'カートが空になりました。' }
      format.json { head :no_content }
    end
  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end


    def cart_params
      params.fetch(:cart, {})
    end
end