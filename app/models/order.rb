class Order < ApplicationRecord
  belongs_to :user
  belongs_to :food_item

  validates :quantity, presence: :true
end
