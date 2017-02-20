class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, :notice => 'Invalid cart'
    else
      render 'show'
    end
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)

      if @cart.save
        redirect_to @cart, notice: 'Cart was successfully created.'
      else
        render :new
      end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
 
    redirect_to root_path, :notice => 'Your cart is currently empty'
  end

end
