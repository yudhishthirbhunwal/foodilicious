require "test_helper"

class OrderTest < ActiveSupport::TestCase

  def setup
    @buyer = users(:buyerone)
    @buyer.add_role :buyer
    @seller = users(:sellerone)
    @seller.add_role :seller
    @food_item = food_items(:one)
    @order = @buyer.orders.create!(food_item_id: @food_item.id, quantity: 5)
  end

  test "should be valid" do
    assert @order.valid?
  end

  test "quantity must be present" do
    @order.quantity = nil
    assert_not @order.valid?
  end

end
