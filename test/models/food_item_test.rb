require "test_helper"

class FoodItemTest < ActiveSupport::TestCase
  def setup
    @user = users(:buyerone)
    @food_item = @user.food_items.build(name: "Chocolate", price: 20, description: "Cadbudy Dairy Milk Silk")
  end

  test "should be valid" do
    assert @food_item.valid?
  end

  test "name should be present" do
    @food_item.name = "    "
    assert_not @food_item.valid?
  end

  test "price should be present" do
    @food_item.price = nil
    assert_not @food_item.valid?
  end

  test "description should be present" do
    @food_item.description = "    "
    assert_not @food_item.valid?
  end

  test "user id should be present" do
    @food_item.user_id = nil
    assert_not @food_item.valid?
  end

  test "name should not be too long" do
    @food_item.name = "a" * 51
    assert_not @food_item.valid?
  end

  test "description should be at most 140 characters" do
    @food_item.description = "a" * 256
    assert_not @food_item.valid?
  end

end
