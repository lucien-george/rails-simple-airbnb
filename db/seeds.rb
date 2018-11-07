# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts 'Cleaning database...'
Flat.destroy_all

puts 'Populating database...'
100.times do
  Flat.create!(
    name: Faker::Superhero.name,
    address: Faker::Address.full_address,
    description: Faker::Company.buzzword,
    price_per_night: rand(100..2000),
    number_of_guests: rand(1..10),
    picture: "https://picsum.photos/350/225/?random"
  )
end

puts 'All done!'
