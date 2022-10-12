# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
@dealership_1 = Dealership.create!(name: "T3SL@", city: "Denver", charging_stations: 3, leasing: true)
@car_1 = @dealership.cars.create!(make: "Tesla", model: "S", year: 2022, auto_pilot: true)
@car_2 = @dealership.cars.create!(make: "Tesla", model: "3", year: 2021, auto_pilot: false)
@car_3 = @dealership.cars.create!(make: "Tesla", model: "X", year: 2020, auto_pilot: true)
@car_4 = @dealership.cars.create!(make: "Tesla", model: "Y", year: 2019, auto_pilot: false)
