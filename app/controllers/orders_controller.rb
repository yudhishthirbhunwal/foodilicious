class OrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @orders = current_user.orders.page(params[:page]).per(20)
    @all_orders = Order.page(params[:page]).per(20)
  end

  def create
    @food_item = FoodItem.find(params[:food_item_id])
    @order = current_user.orders.build(order_params)
    @order.food_item_id = @food_item.id
    if @order.save
      UserMailer.with(food_item: @food_item, buyer: current_user, seller: @food_item.user).seller_order_email.deliver_now
      UserMailer.with(food_item: @food_item, buyer: current_user, seller: @food_item.user).buyer_order_email.deliver_now
    end
    @food_item.increment!(:order_count)
    respond_to do |format|
      format.html { redirect_to @food_item, notice: "AJAX Order placed Successfully!" }
      format.js
    end
    # flash[:notice] = "Order placed successfully!"
  end
  
  def destroy
    @order = Order.find(params[:id])
    @food_item = @order.food_item
    UserMailer.with(food_item: @order.food_item, buyer: current_user, seller: @order.food_item.user).seller_cancel_email.deliver_now
    UserMailer.with(food_item: @order.food_item, buyer: current_user, seller: @order.food_item.user).buyer_cancel_email.deliver_now
    @order.delete
    respond_to do |format|
      format.html { redirect_to food_items_path, alert: "AJAX Order Cancelled!" }
      format.js
    end
    # flash[:alert] = "Order Cancelled!"
  end

  private

    def order_params
      params.require(:order).permit(:quantity)
    end
end
