class Dealership < ApplicationRecord
  has_many :cars

  def self.created_by
    self.order(created_at: :asc)
  end
end
