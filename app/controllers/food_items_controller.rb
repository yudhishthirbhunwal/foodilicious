class FoodItemsController < ApplicationController

  before_action :get_food_item, only: [:show, :edit, :update, :destroy]

  def index
    @food_items = FoodItem.page(params[:page]).per(20)
    @food_items_by_seller = current_user.food_items.page(params[:page]).per(20)
  end

  def show
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = current_user.food_items.build(food_item_params)
    if @food_item.save
      flash[:notice] = "Food item created successfully!"
      redirect_to @food_item
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @food_item.update(food_item_params)
      flash[:notice] = "Food item edited successfully!"
      redirect_to @food_item
    else
      render 'edit'
    end
  end

  def destroy
    @food_item.destroy
    flash[:alert] = "Food item deleted successfully!"
    redirect_to food_items_path
  end

  private

    def get_food_item
      @food_item = FoodItem.find(params[:id])
    end

    def food_item_params
      params.require(:food_item).permit(:name, :price, :description)
    end
end
