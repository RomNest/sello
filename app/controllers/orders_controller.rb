class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.paginate(:page=>params[:page], :order=>'created_at desc',
      :per_page=>10)
  end

  def show;end

  def new
    @cart = current_cart
    if @cart.order_posts.empty?
      redirect_to root_path, :notice => "Your cart is empty"
      return
    end
 
    @order = Order.new
  end

  def edit;end

  def create
    @order = Order.new(order_params)
    @order.add_order_posts_from_cart(current_cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path, notice: 'Thank you for your order.'
    else
      @cart = current_cart
      render 'new' 
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.' 
    else
      render'edit'
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:full_name, :address, :email, :postcode, :pay_type)
    end
end
