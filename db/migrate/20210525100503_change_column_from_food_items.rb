class ChangeColumnFromFoodItems < ActiveRecord::Migration[6.1]
  def up
    change_column :food_items, :price, :float
  end
  def down
    change_column :food_items, :price, :integer
  end
end
