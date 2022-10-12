require 'rails_helper'

RSpec.describe 'the child show page' do
  describe 'As a visitor' do
    describe 'when I visit the child show page' do
      before :each do
        @dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
        @dealership_1 = Dealership.create!(name: "T3SL@", city: "Denver", charging_stations: 3, leasing: true)
        @car_1 = @dealership.cars.create!(make: "Tesla", model: "S", year: 2022, auto_pilot: true)
        @car_2 = @dealership.cars.create!(make: "Tesla", model: "3", year: 2021, auto_pilot: false)
        @car_3 = @dealership.cars.create!(make: "Tesla", model: "X", year: 2020, auto_pilot: true)
        @car_4 = @dealership.cars.create!(make: "Tesla", model: "Y", year: 2019, auto_pilot: false)
      end
      it "see the child with that id and their attributes" do
        visit "/cars/#{@car_1.id}"
        expect(page).to have_content(@car_1.make)
        expect(page).to have_content(@car_1.model)
        expect(page).to have_content(@car_1.year)
        expect(page).to have_content(@car_1.auto_pilot)
        expect(page).to_not have_content(@car_2.make)
        expect(page).to_not have_content(@car_2.model)
        expect(page).to_not have_content(@car_2.year)
        expect(page).to_not have_content(@car_2.auto_pilot)
      end
    end
  end
end
