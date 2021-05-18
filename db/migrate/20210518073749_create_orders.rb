class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food_item, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
