require "test_helper"

class FoodItemsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @seller_one = users(:sellerone)
    @seller_one.add_role(:seller)
    @seller_two = users(:sellertwo)
    @seller_two.add_role(:seller)
    @buyer = users(:buyerone)
    @buyer.add_role(:buyer)
    @food_two = food_items(:two)
  end
  
  test "enlist a food item" do
    sign_in(@seller_one)
    get food_items_path
    assert_select "a[href=?]", food_item_path(@food_two), count: 0
    get new_food_item_url
    assert_response :success
    assert_difference 'FoodItem.count', 1 do
      post food_items_path params: { food_item: { name: "Food", price: 337.586, description: "this is random text!!!"}}
    end
    assert_not flash.empty?
    assert_response :redirect
    follow_redirect!
    assert_template 'food_items/show'
    sign_out(@seller_one)
  end

end
