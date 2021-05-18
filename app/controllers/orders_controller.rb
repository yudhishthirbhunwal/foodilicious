class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.page(params[:page]).per(20)
  end

  def create
    @food_item = FoodItem.find(params[:food_item_id])
    @order = current_user.orders.build(order_params)
    @order.food_item_id = @food_item.id
    @order.save
    flash[:notice] = "Order placed successfully!"
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.delete
    flash[:alert] = "Order Cancelled!"
    redirect_back(fallback_location: root_path)
  end

  private

    def order_params
      params.require(:order).permit(:quantity)
    end
end
