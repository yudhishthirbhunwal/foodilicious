# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user.
User.create!( first_name: "User1",
              last_name: "Test1",
              phone_number: "9999965655",
              email: "user1test1@yopmail.com",
              password: "@Foobar1",
              password_confirmation: "@Foobar1",
              confirmed_at: Time.now.utc )

# Add admin to first user.
User.first.add_role :admin

# Generate a bunch of additional users.
99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  phone_number = (0..9).to_a.shuffle.join
  email = "user#{n+2}test#{n+2}@yopmail.com"
  password = "@Foobar1"
  User.create!( first_name: first_name,
                last_name: last_name,
                phone_number: phone_number,
                email: email,
                password: password,
                password_confirmation: password,
                confirmed_at: Time.now.utc )
end

# Assign roles.
users = User.all
buyers = users[1..50]
buyers.each { |buyer| buyer.add_role :buyer }
sellers = users[51..100]
sellers.each { |seller| seller.add_role :seller }

# Generate food items for a subset of sellers.
sellers = User.with_role(:seller).sample(5)
5.times do
  sellers.each do |seller|
    name = Faker::Food.dish
    price = (rand(3.000..100.000)).round(2)
    description = Faker::Lorem.sentence(word_count: 4)
    seller.food_items.create!(name: name, price: price, description: description)
  end
end
sellers = User.with_role(:seller).sample(5)
5.times do
  sellers.each do |seller|
    name = Faker::Food.fruits
    price = (rand(3.000..100.000)).round(2)
    description = Faker::Lorem.sentence(word_count: 6)
    seller.food_items.create!(name: name, price: price, description: description)
  end
end
sellers = User.with_role(:seller).sample(5)
5.times do
  sellers.each do |seller|
    name = Faker::Food.vegetables
    price = (rand(3.000..100.000)).round(2)
    description = Faker::Lorem.sentence(word_count: 10)
    seller.food_items.create!(name: name, price: price, description: description)
  end
end
sellers = User.with_role(:seller).sample(5)
5.times do
  sellers.each do |seller|
    name = Faker::Dessert.variety
    price = (rand(3.000..100.000)).round(2)
    description = Faker::Lorem.sentence(word_count: 7)
    seller.food_items.create!(name: name, price: price, description: description)
  end
end

# Places orders on food items.
buyers = User.with_role(:buyer).sample(20)
food_items = FoodItem.all.sample(20)
10.times do
  buyers.each do |buyer|
    food_items.each do |food|
      quantity = rand 1..20
      buyer.orders.create!(quantity: quantity, food_item_id: food.id)
    end
  end
end
