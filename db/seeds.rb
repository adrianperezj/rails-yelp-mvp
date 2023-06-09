# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

categories = %w(chinese italian japanese french belgian)

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
5.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample
  )
  20.times do
    Review.create(
        rating: rand(0..5),
        content: Faker::Restaurant.review,
        restaurant_id: restaurant.id
      )
  end
end



puts "Finished!"
