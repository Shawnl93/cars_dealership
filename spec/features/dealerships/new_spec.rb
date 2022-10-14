require 'rails_helper'

RSpec.describe 'the parent creation ' do
  describe 'As a visitor' do
    describe 'when I visit the parents index page' do
      before :each do
        @dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
        @dealership_1 = Dealership.create!(name: "T3SL@", city: "Denver", charging_stations: 3, leasing: true)
        @car_1 = @dealership.cars.create!(make: "Tesla", model: "S", year: 2022, auto_pilot: true)
        @car_2 = @dealership_1.cars.create!(make: "Tesla", model: "3", year: 2021, auto_pilot: false)
        @car_3 = @dealership.cars.create!(make: "Tesla", model: "X", year: 2020, auto_pilot: true)
        @car_4 = @dealership_1.cars.create!(make: "Tesla", model: "Y", year: 2019, auto_pilot: false)
      end

      it "has a link to create a new parent record" do
        visit '/dealerships'
        click_link "New Dealership"
        expect(current_path).to eq("/dealerships/new")
      end

      it "can create a new parent" do
        visit "/dealerships/new"
        fill_in("Name", with: "TESL@")
        fill_in("City", with: "Boulder")
        fill_in("charging_stations", with: 10)
        fill_in("Leasing", with: "true")
        click_button("Create Dealership")
        expect(current_path).to eq("/dealerships")
      end
    end
  end
end
