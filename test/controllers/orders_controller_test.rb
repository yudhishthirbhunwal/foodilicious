require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:buyerone)
    sign_in(@user)
    @food_item = food_items(:aavocado)
    @order = orders(:one)
  end

  test "redirect if not signed in" do
    sign_out :user
    get orders_path
    assert_response :redirect
  end
  
  test "should get index" do
    get orders_path
    assert_response :success
  end

  test "should create an order" do
    assert_difference 'Order.count', 1 do
      post orders_path params: { food_item_id: @food_item.id, order: { quantity: 5 } }
    end
    assert_response :redirect
    assert_difference 'ActionMailer::Base.deliveries.count', +2 do
      post orders_path params: { food_item_id: @food_item.id, order: { quantity: 5 } }
    end
  end

  test "should cancel an order" do
    assert_difference 'Order.count', -1 do
      delete order_path(@order)
    end
    assert_response :redirect
  end
end
