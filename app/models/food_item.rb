class FoodItem < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders, dependent: :destroy

  default_scope -> { order(name: :asc) }

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true
  validates :description, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end
