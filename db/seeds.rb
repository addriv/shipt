# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

statuses = ["waiting for delivery", "on its way", "delivered"]

# Customers
10.times do
  Customer.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name
  )
end 

# Orders
3.times do
  Order.create(
    customer_id: rand(1..10),
    status: statuses[rand(2)]
  )
end

# Categories
Category.create(name: "Beverages")
Category.create(name: "Chips")
Category.create(name: "Utensils")

# Products
# 1 - Beverages
Product.create(name: "Sprite") 
Product.create(name: "Coca-Cola") 
Product.create(name: "Dasani Water") 

# 2 - Chips
Product.create(name: "Doritos Nacho Cheese")
Product.create(name: "Lays Original")
Product.create(name: "Tostitos Tortilla Chips")

# 3 - Utensils
Product.create(name: "Plastic Spoon")
Product.create(name: "Plastic Fork")
Product.create(name: "Plastic Knife")

# Product Categories
(1..3).each do |category_id|
  (1..3).each do |j|
    product_id = 3 * (category_id - 1) + j
    ProductCategory.create(
      product_id: product_id,
      category_id: category_id
    )
  end
end

# Order Products
(1..3).each do |order_id|
  num_items = rand(1..9)
  product_ids = []
  num_items.times do 
    product_id = rand(1..9) while product_ids.include?(product_id)
    OrderProduct.create(
      order_id: order_id,
      product_id: product_id,
      quantity: rand(1..5)
    )
  end
end
