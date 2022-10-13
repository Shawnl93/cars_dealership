class Dealership < ApplicationRecord
  has_many :cars

  def created_by
    self.cars
    binding.pry
  end
end
