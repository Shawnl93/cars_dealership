require 'rails_helper'

RSpec.describe 'the parents index' do
  describe 'As a visitor' do
    describe 'when I visit the parents index page' do
      before :each do
        @dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
        @dealership_1 = Dealership.create!(name: "T3SL@", city: "Denver", charging_stations: 3, leasing: true)
        @car_1 = @dealership.cars.create!(make: "Tesla", model: "S", year: 2022, auto_pilot: true)
        @car_2 = @dealership_1.cars.create!(make: "Tesla", model: "3", year: 2021, auto_pilot: false)
        @car_3 = @dealership.cars.create!(make: "Tesla", model: "X", year: 2020, auto_pilot: true)
        @car_4 = @dealership_1.cars.create!(make: "Tesla", model: "Y", year: 2019, auto_pilot: false)
        visit '/dealerships'
      end
      it "can display name of parent record in the system" do
        expect(page).to have_content(@dealership.name)
      end

      it "order by most recently created" do
        expect(@dealership_1.name).to appear_before(@dealership.name)
      end

      it "can see when the record was created" do
        expect(page).to have_content(@dealership.created_at)
        expect(page).to have_content(@dealership_1.created_at)
      end

      it "has link at top of page that link to child index" do
        click_on "cars"
        expect(current_path).to eq("/cars")
      end

      it "has link at top of page that link to parent index" do
        click_on "dealerships"
        expect(current_path).to eq("/dealerships")
      end

      it "has link to edit parents info" do
        visit "/dealerships"
        click_on "Update #{@dealership.name}"
        expect(current_path).to eq("/dealerships/#{@dealership.id}/edit")
      end

    end
  end
end
