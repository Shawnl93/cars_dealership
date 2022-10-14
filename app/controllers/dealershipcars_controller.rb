class DealershipcarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:dealership_id])
    @cars = @dealership.cars
  end

  def new
    @dealership = Dealership.find(params[:dealership_id])
  end

  def create
    @dealership = Dealership.find(params[:dealership_id])
    car = @dealership.cars.create(dealershipcars_params)
    redirect_to "/dealerships/#{@dealership.id}/cars"
  end


private

    def dealershipcars_params
      params.permit(:dealership_id, :make, :model, :year, :auto_pilot)
    end
end
