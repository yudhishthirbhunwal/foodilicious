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
  validates :phone_number, presence: true,
                           length: { minimum: 10, maximum: 10 },
                           format: { with: VALID_PHONE_REGEX },
                           uniqueness: true
  validates :email, length: { maximum: 255 }
  validates :password, format: { with: VALID_PASSWORD }

  def get_order(food_item)
    self.orders.find_by(food_item_id: food_item.id)
  end
end
