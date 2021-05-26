require "test_helper"

class FoodItemsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sellerone)
    @user.add_role(:seller)
    @other_user = users(:sellerthree)
    @other_user.add_role(:seller)
    @food_item = food_items(:aavocado)
  end

  test "redirect if not signed in" do
    get food_items_path
    assert_response :redirect
  end

  test "should get index" do
    sign_in(@user)
    get food_items_path
    assert_response :success
  end

  test "should get redirected to show after create" do
    sign_in(@user)
    assert_difference 'FoodItem.count', 1 do
      post food_items_path params: { food_item: { name: "Aaloo", price: 10, description: "hello" } }
    end
    assert_response :redirect
    follow_redirect!
    assert_template 'food_items/show'
  end

  test "should get redirected to index after destroy" do
    sign_in(@other_user)
    get food_items_path
    delete food_item_path(@food_item)
    assert_response :redirect
    follow_redirect!
    assert_not flash.empty?
    assert_template 'food_items/index'
  end
end
