require 'rails_helper'


RSpec.describe 'the parents index' do
  describe 'As a visitor' do
    describe 'when I visit the parents index page' do
      before :each do
        @dealership = Dealership.create!(name: "T3SLA", city: "Lone_tree", charging_stations: 5, leasing: true)
      end
      it "can display name of parent record in the system" do
        visit '/dealerships'
        expect(page).to have_content(@dealership.name)
      end
    end
  end
end
