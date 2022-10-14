require 'rails_helper'

RSpec.describe 'the parent child creation' do
  describe 'as a visitor' do
    describe 'when i visit a parent child index page' do
      before :each do
        @dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
        @dealership_1 = Dealership.create!(name: "T3SL@", city: "Denver", charging_stations: 3, leasing: true)
        @car_1 = @dealership.cars.create!(make: "Tesla", model: "S", year: 2022, auto_pilot: true)
        @car_2 = @dealership_1.cars.create!(make: "Tesla", model: "3", year: 2021, auto_pilot: false)
        @car_3 = @dealership.cars.create!(make: "Tesla", model: "X", year: 2020, auto_pilot: true)
        @car_4 = @dealership_1.cars.create!(make: "Tesla", model: "Y", year: 2019, auto_pilot: false)
      end

      it "has a link to create a new parent child" do
        visit "/dealerships/#{@dealership.id}/cars"
        click_on "New Car"
        expect(current_path).to eq("/dealerships/#{@dealership.id}/cars/new")
      end

      it "Can create a NEW PARENT CHILD" do
        visit "/dealerships/#{@dealership.id}/cars/new"
        fill_in("make", with: "Tesla")
        fill_in("model", with: "Roadster")
        fill_in("year", with: 2023)
        fill_in("auto_pilot", with: true)
        click_on("Create Car")
        expect(current_path).to eq("/dealerships/#{@dealership.id}/cars")
      end
    end
  end
end
