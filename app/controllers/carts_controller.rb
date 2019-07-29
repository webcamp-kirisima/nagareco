class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all

  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @product_randoms = Product.order("RANDOM()").limit(3)
    @line_item = LineItem.new
  end

  # GET /carts/new
  def new
    @cart = Cart.new

  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
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
  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
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

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy

    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'カートが空になりました。' }
      format.json { head :no_content }
    end
  end

  def correct_user
      user = User.find(params[:user_id])
      if current_user != user
        redirect_to root_path
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end
end