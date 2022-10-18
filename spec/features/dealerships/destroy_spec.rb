require 'rails_helper'

RSpec.describe 'the parents index page' do
  describe 'As a visitor' do
    describe 'When i visit a parents index page' do
      before :each do
        @dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
        @dealership_1 = Dealership.create!(name: "T3SL@", city: "Denver", charging_stations: 3, leasing: true)
        @car_1 = @dealership.cars.create!(make: "Tesla", model: "S", year: 2022, auto_pilot: true)
        @car_2 = @dealership_1.cars.create!(make: "Tesla", model: "3", year: 2021, auto_pilot: false)
        @car_3 = @dealership.cars.create!(make: "Tesla", model: "X", year: 2020, auto_pilot: true)
        @car_4 = @dealership_1.cars.create!(make: "Tesla", model: "Y", year: 2019, auto_pilot: false)
      end

      it "can delete parent from index page" do
        visit "/dealerships/#{@dealership.id}"
        click_button "Delete Dealership"
        expect(current_path).to eq("/dealerships")
        expect(page).to_not have_content(@dealership.name)
      end
    end
  end
end
