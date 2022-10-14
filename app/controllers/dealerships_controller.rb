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
    dealership = Dealership.create(name: params[:name], city: params[:city], charging_stations: params[:charging_stations], leasing: params[:leasing])
    redirect_to "/dealerships"
  end
end
