class FoodItemsController < ApplicationController
  load_and_authorize_resource

  before_action :get_food_item, only: [:show, :edit, :update, :destroy]

  def index
    if !params[:keywords].blank?
      searched_food = FoodItem.search(params[:keywords])
      if searched_food.any?
        flash.now[:notice] = "#{searched_food.count} food #{"item".pluralize(searched_food.count)} found!"
        @food_items = searched_food.filter_food(params[:filters]).page(params[:page]).per(21)
        @food_items_by_seller = searched_food.filter_food(params[:filters]).page(params[:page]).per(21)
      else
        flash.now[:alert] = "'#{params[:keywords]}' not found in Food Items"
        @food_items = FoodItem.filter_food(params[:filters]).page(params[:page]).per(21)
        @food_items_by_seller = current_user.food_items.filter_food(params[:filters]).page(params[:page]).per(21)
      end
    else
      @food_items = FoodItem.filter_food(params[:filters]).page(params[:page]).per(21)
      @food_items_by_seller = current_user.food_items.filter_food(params[:filters]).page(params[:page]).per(21)
    end
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
