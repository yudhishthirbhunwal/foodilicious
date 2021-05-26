class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    if !params[:keywords].nil?
      searched_user = User.search(params[:keywords])
      if searched_user.any?
        flash.now[:notice] = "#{searched_user.count} #{"user".pluralize(searched_user.count)} found!"
        @allusers = searched_user.page(params[:page]).per(21)
        @buyers = searched_user.page(params[:page]).per(21)
        @sellers = searched_user.page(params[:page]).per(21)
      else
        flash.now[:alert] = "'#{params[:keywords]}' not found in Users"
        @allusers = User.page(params[:page]).per(21)
        @buyers = current_user.get_all_buyers.page(params[:page]).per(21)
        @sellers = User.with_role(:seller).page(params[:page]).per(21)
      end
    else
      @allusers = User.page(params[:page]).per(21)
      @buyers = current_user.get_all_buyers.page(params[:page]).per(21)
      @sellers = User.with_role(:seller).page(params[:page]).per(21)
    end
  end

  def show
    @user = User.find(params[:id])
    @orders = @user.get_all_orders_for(current_user).page(params[:page]).per(10) if @user.is_buyer?
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:alert] = "User deleted successfully!"
    else
      flash[:alert] = "Error deleting the user!"
    end
    redirect_to users_path
  end
end
