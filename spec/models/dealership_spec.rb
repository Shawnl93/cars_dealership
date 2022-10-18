require 'rails_helper'

RSpec.describe Dealership do
  it {should have_many :cars}

  describe 'instance methods' do
    before :each do
      @dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
      @dealership_1 = Dealership.create!(name: "T3SL@", city: "Denver", charging_stations: 3, leasing: true)
      @car_1 = @dealership.cars.create!(make: "Tesla", model: "S", year: 2022, auto_pilot: true)
      @car_2 = @dealership_1.cars.create!(make: "Tesla", model: "3", year: 2021, auto_pilot: false)
      @car_3 = @dealership.cars.create!(make: "Tesla", model: "X", year: 2020, auto_pilot: true)
      @car_4 = @dealership_1.cars.create!(make: "Tesla", model: "Y", year: 2019, auto_pilot: false)
    end
    it "orders by most recently created" do
      expect(Dealership.created_by).to eq([@dealership_1, @dealership])
    end

    it "can count number of cars" do
      expect(@dealership.car_count).to eq(2)
    end
  end
end
