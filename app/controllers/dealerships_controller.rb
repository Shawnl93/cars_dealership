class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def new

  end

  def create
    dealership = Dealership.create(dealership_params)
    redirect_to "/dealerships"
  end

  def dealership_params
    params.permit(:name, :city, :charging_stations, :leasing)
  end
end
