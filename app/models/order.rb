class Order < ApplicationRecord
  belongs_to :user
  belongs_to :food_item

  validates :quantity, presence: :true, numericality: { greater_than_or_equal_to: 1 }
end
