class Dealership < ApplicationRecord
  has_many :cars, :dependent => :delete_all

  def self.created_by
    self.order(created_at: :desc)
  end

  def car_count
    self.cars.count
  end
end
