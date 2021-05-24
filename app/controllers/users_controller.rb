class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    @allusers = User.page(params[:page]).per(20)
    @buyers = current_user.get_all_buyers.page(params[:page]).per(20)
    @sellers = User.with_role(:seller).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @orders = @user.get_all_orders_for(current_user).page(params[:page]).per(10) if @user.is_buyer?
  end
end
