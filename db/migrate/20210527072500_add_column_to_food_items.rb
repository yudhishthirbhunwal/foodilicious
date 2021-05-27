class AddColumnToFoodItems < ActiveRecord::Migration[6.1]
  def change
    add_column :food_items, :order_count, :integer, default: 0, null: false
  end
end
