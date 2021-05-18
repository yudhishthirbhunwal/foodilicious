class FoodItem < ApplicationRecord
  belongs_to :user

  default_scope -> { order(name: :asc) }

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true
  validates :description, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end
