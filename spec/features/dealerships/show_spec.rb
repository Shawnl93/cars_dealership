require 'rails_helper'

RSpec.describe 'the parents show page' do
  describe 'As a visitor' do
    describe 'when I visit the parents show page' do
      before :each do
        @dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
        @dealership_1 = Dealership.create!(name: "T3SL@", city: "Denver", charging_stations: 3, leasing: true)
        @car_1 = @dealership.cars.create!(make: "Tesla", model: "S", year: 2022, auto_pilot: true)
        @car_2 = @dealership_1.cars.create!(make: "Tesla", model: "3", year: 2021, auto_pilot: false)
        @car_3 = @dealership.cars.create!(make: "Tesla", model: "X", year: 2020, auto_pilot: true)
        @car_4 = @dealership_1.cars.create!(make: "Tesla", model: "Y", year: 2019, auto_pilot: false)
        visit "/dealerships/#{@dealership.id}"
      end
      it "see the parent with that id and all their attributes" do
        expect(page).to have_content(@dealership.id)
        expect(page).to have_content(@dealership.name)
        expect(page).to have_content(@dealership.city)
        expect(page).to have_content(@dealership.charging_stations)
        expect(page).to have_content(@dealership.leasing)
        expect(page).to_not have_content(@dealership_1.name)
        expect(page).to_not have_content(@dealership_1.city)
      end

      it "show number of children associated with this parent" do
        expect(page).to have_content("Cars at T3SLA dealership: 2")
      end

      it "has link at top of page that link to child index" do
        click_on "cars"
        expect(current_path).to eq("/cars")
      end

      it "has link at top of page that link to parent index" do
        click_on "dealerships"
        expect(current_path).to eq("/dealerships")
      end
    end
  end
end
