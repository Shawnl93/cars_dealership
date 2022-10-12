class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end

  def show

  end
end
