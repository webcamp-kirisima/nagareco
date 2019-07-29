class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @line_items = LineItem.all
  end


  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end


  def create


  @cart = current_cart

  product = Product.find(params[:product_id])

    @line_item = @cart.line_items.where(product_id: product.id).where(cart_id: @cart.id).first

    if !@line_item.present?
      @line_item = @cart.line_items.build(product: product, quantity: line_item_params[:quantity])
    else
      sum = @line_item.quantity + line_item_params[:quantity].to_i
      @line_item.update(quantity: sum)
    end
    p @line_item

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'カートに商品が追加されました。' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
  end
end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item.cart, notice: 'カートの中身を変更しました。' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

 def destroy
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_url(@line_item.cart_id), notice: '商品をカートから削除しました。' }
      format.json { head :no_content }
    end
  end

  def correct_user
      @cart = current_user.carts.find_by(id: params[:id])
      unless @cart
      redirect_to root_path
      end
    end


  private

    def set_line_item
      @line_item = LineItem.find(params[:id])
    end


    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id, :quantity)
    end

end