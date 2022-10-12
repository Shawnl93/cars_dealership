class CreateDealerships < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.string :city
      t.integer :charging_stations
      t.boolean :leasing

      t.timestamps
    end
  end
end
