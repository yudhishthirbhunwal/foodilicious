require "test_helper"

class OrdersInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @seller_one = users(:sellerone)
    @seller_one.add_role(:seller)
    @seller_two = users(:sellertwo)
    @seller_two.add_role(:seller)
    @buyer = users(:buyerone)
    @buyer.add_role(:buyer)
    @food_two = food_items(:two)
  end

  test "should be able to place and cancel an order" do
    sign_in(@buyer)
    get food_items_path
    assert_response :success
    assert_select "a[href=?]", food_item_path(@food_two)
  end
end
