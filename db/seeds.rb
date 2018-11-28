# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Flat.destroy_all

puts 'Creating flats...'
20.times do
  Flat.create!(
    name: Faker::Lorem.sentence,
    address: Faker::Address.street_address,
    description: Faker::Lorem.paragraph_by_chars(255),
    price_per_night: rand(50..150),
    number_of_guests: rand(1..5),
    picture_url: 'https://source.unsplash.com/collection/1536566'
  )
end
puts 'Finished!'
