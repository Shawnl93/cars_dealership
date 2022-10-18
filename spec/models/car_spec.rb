require 'rails_helper'

RSpec.describe Car, type: :model do
  it {should belong_to :dealership}

  describe 'instance method ' do
    before :each do
      @dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
      @dealership_1 = Dealership.create!(name: "T3SL@", city: "Denver", charging_stations: 3, leasing: true)
      @car_1 = @dealership.cars.create!(make: "Tesla", model: "S", year: 2022, auto_pilot: true)
      # @car_2 = @dealership_1.cars.create!(make: "Tesla", model: "3", year: 2021, auto_pilot: false)
      @car_3 = @dealership.cars.create!(make: "Tesla", model: "X", year: 2020, auto_pilot: true)
      @car_4 = @dealership_1.cars.create!(make: "Tesla", model: "Y", year: 2019, auto_pilot: false)
    end

    it "only show car with true value" do
      expect(Car.true_value).to eq([@car_1, @car_3])
    end

    it "orders car in not alphabetical order" do
      expect(Car.order_by_model).to eq([@car_4, @car_3, @car_1])
    end
  end
end
