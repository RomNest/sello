class OrderPostsController < ApplicationController
  before_action :set_order_post, only: [:show, :edit, :update, :destroy]

  def index
    @order_posts = OrderPost.all
  end

  def show;end

  def new
    @order_post = OrderPost.new
  end

  def edit
  end

  def create
    @cart = current_cart
    post = Post.find(params[:post_id])
    @order_post = @cart.order_posts.build
    @order_post.post = post

      if @order_post.save
        redirect_to @order_post.cart, notice: 'Order post was successfully created.'
      else
        render :new
      end
  end

  def update
      if @order_post.update(order_post_params)
        redirect_to @order_post, notice: 'Order post was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @order_post.destroy
    redirect_to order_posts_url, notice: 'Order post was successfully destroyed.'
  end

  private
    def set_order_post
      @order_post = OrderPost.find(params[:id])
    end

      def order_post_params
      params.require(:order_post).permit(:post_id, :cart_id)
    end
end
