class Car < ApplicationRecord
  belongs_to :dealership

  def self.true_value
    self.where(auto_pilot: :true)
  end

  def self.order_by_model
    self.order(model: :desc)
  end
end
