# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Cleaning database"
User.destroy_all
Equipment.destroy_all

puts "Creating users"
10.times do
user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone:Faker::PhoneNumber.cell_phone_in_e164, password: "12345678", user_type: "Owner")
end

puts "Creating Equipments"
Equipment.create!(title: "rameur", description: "This is a fancy rowing machine", daily_rate: 50, user: User.first)
Equipment.create!(title: "vélo", description: "This is a fancy rowing machine", daily_rate: 50, user: User.first)
Equipment.create!(title: "tapis de course", description: "This is a fancy rowing machine", daily_rate: 50, user: User.first)

puts "Finished!"

