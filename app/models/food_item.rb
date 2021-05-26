class FoodItem < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders, dependent: :destroy

  scope :filter_by_name_asc, -> { order(name: :asc) }
  scope :filter_by_price_asc, -> { order(price: :asc) }
  scope :filter_by_price_desc, -> { order(price: :desc) }
  scope :filter_by_creation, -> { order(created_at: :desc) }

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true

  # Searchs a particular food item.
  def self.search(keywords)
    if keywords
      self.where("LOWER(name) LIKE (?) OR price LIKE (?)", "%#{keywords.downcase}%", keywords.to_f)
    end
  end

  def self.filter_food(params)
    if params == "Price (Low to High)"
      self.filter_by_price_asc
    elsif params == "Price (High to Low)"
      self.filter_by_price_desc
    elsif params == "Most Recent"
      self.filter_by_creation
    else
      self.filter_by_name_asc
    end
  end
end
