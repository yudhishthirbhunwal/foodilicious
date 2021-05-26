class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :food_items, dependent: :destroy
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  VALID_PHONE_REGEX = /\d{10}/
  VALID_PASSWORD = /\A
    (?=.*\d)
    (?=.*[A-Z])
    (?=.*[[:^alnum:]])
    /x

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :phone_number, presence: true, length: { is: 10 },
                           format: { with: VALID_PHONE_REGEX },
                           uniqueness: true
  validates :email, length: { maximum: 255 }
  validates :password, format: { with: VALID_PASSWORD, message: 'should contain at least one capital letter, one digit and one special character' }

  def get_order(food_item)
    self.orders.find_by(food_item_id: food_item.id)
  end

  # Get all buyers for a particular seller.
  def get_all_buyers
    # items_by_seller_ids = "SELECT id FROM food_items WHERE user_id = :user_id",
    # buyer_ids = "SELECT DISTINCT user_id FROM orders WHERE food_item_id IN (#{items_by_seller_ids})"
    # User.where("id IN (#{buyer_ids})", user_id: self.id)
    # User.joins(orders: { food_item: :user }).merge(FoodItem.where(user_id: self.id)).distinct
    User.joins(:orders).where(orders: { food_item: self.food_items }).distinct
  end

  # Gets all the orders by buyers for a particular seller.
  def get_all_orders_for(seller)
    # all_orders_for = self.orders.dup.clear
    # seller.food_items.each do |food|
    #   all_orders_for.push(self.orders.where(food_item_id: food.id))
    # end
    # all_orders_for
    Order.where(food_item: seller.food_items, user: self)
  end

  # Searchs a particular user.
  def self.search(keywords)
    if keywords
      self.where("LOWER(first_name) LIKE (?) OR LOWER(last_name) LIKE (?)", "%#{keywords.downcase}%", "%#{keywords.downcase}%")
    end
  end

end
