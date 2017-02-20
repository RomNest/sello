class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def index
    @carts = Cart.all
  end

  def show;end

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

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

end
