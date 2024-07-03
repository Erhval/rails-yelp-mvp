require 'faker'

Restaurant.destroy_all
Review.destroy_all

5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
  rand(1..5).times do
    restaurant.reviews.create(
      rating: rand(0..5),
      content: Faker::Restaurant.review
    )
  end
end

puts "Created #{Restaurant.count} restaurants with #{Review.count} reviews"
