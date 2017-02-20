require 'test_helper'

class OrderPostsControllerTest < ActionController::TestCase
  setup do
    @order_post = order_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_post" do
    assert_difference('OrderPost.count') do
      post :create, order_post: { cart_id: @order_post.cart_id, post_id: @order_post.post_id }
    end

    assert_redirected_to order_post_path(assigns(:order_post))
  end

  test "should show order_post" do
    get :show, id: @order_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_post
    assert_response :success
  end

  test "should update order_post" do
    patch :update, id: @order_post, order_post: { cart_id: @order_post.cart_id, post_id: @order_post.post_id }
    assert_redirected_to order_post_path(assigns(:order_post))
  end

  test "should destroy order_post" do
    assert_difference('OrderPost.count', -1) do
      delete :destroy, id: @order_post
    end

    assert_redirected_to order_posts_path
  end
end
