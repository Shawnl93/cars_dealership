require 'rails_helper'

RSpec.describe 'editing parent' do
  describe 'as a visitor' do
    describe ' when i visit a parents show page ' do
      before :each do
        @dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
        @dealership_1 = Dealership.create!(name: "T3SL@", city: "Denver", charging_stations: 3, leasing: true)
        @car_1 = @dealership.cars.create!(make: "Tesla", model: "S", year: 2022, auto_pilot: true)
        @car_2 = @dealership_1.cars.create!(make: "Tesla", model: "3", year: 2021, auto_pilot: false)
        @car_3 = @dealership.cars.create!(make: "Tesla", model: "X", year: 2020, auto_pilot: true)
        @car_4 = @dealership_1.cars.create!(make: "Tesla", model: "Y", year: 2019, auto_pilot: false)
      end

      it "has a link to update parent" do
        visit "/dealerships/#{@dealership.id}"
        click_button "Update Dealership"
        expect(page).to eq("/dealerships/#{@dealership.id}/edit")
      end
    end
  end
end
