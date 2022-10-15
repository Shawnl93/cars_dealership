class Car < ApplicationRecord
  belongs_to :dealership

  def self.true_value
    self.where(auto_pilot: :true)
  end
end
