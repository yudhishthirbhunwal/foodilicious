module OrdersHelper
  def get_food_item(order)
    FoodItem.find(order.food_item_id)
  end
end
