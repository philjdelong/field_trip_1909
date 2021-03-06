require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when i visit a passengers show page", type: :feature do
    before :each do
      @southwest = Airline.create(name: "Southwest")

      @flight_1 = @southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      @flight_2 = @southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Denver", arrival_city: "Oakland")
      @flight_3 = @southwest.flights.create(number: "SW3", date: "12/09/19", time: "0800", departure_city: "Columbus", arrival_city: "Louisville")
      @flight_4 = @southwest.flights.create(number: "SW4", date: "12/10/19", time: "0700", departure_city: "Baltimore", arrival_city: "Portland")

      @flight_5 = @southwest.flights.create(number: "SW5", date: "12/11/19", time: "0600", departure_city: "Tampa", arrival_city: "Denver")

      @phil = Passenger.create(
        name: 'Phil',
        age:  29
      )

      @courtney = Passenger.create(
        name: 'Courtney',
        age:  28
      )

      @flight_1.passengers << @phil
      @flight_2.passengers << @phil
      @flight_4.passengers << @phil

      visit "/passengers/#{@phil.id}"
    end

    it "i see the passenger name" do
      expect(page).to_not have_content('Courtney')

      expect(page).to have_content('Phil')
    end

    it "i see all flight numbers for that passenger" do
      expect(page).to have_content('SW1')
      expect(page).to have_content('SW2')
      expect(page).to_not have_content('SW3')
      expect(page).to have_content('SW4')
    end

    it "i can click on a flight number and see that flight show page" do
      click_on 'SW4'
      expect(current_path).to eq("/flights/#{@flight_4.id}")
    end

    it "i see a new flight form" do
      expect(page).to have_content('Add New Flight')

      fill_in 'Flight', with: "SW5"
      click_on 'Add Flight'

      expect(current_path).to eq("/passengers/#{@phil.id}")

      expect(page).to have_content('SW5')
    end
  end
end

# User Story 3, Assign a Passenger to a Flight
#
# As a visitor
# When I visit a passengers show page
# I see a form to add a flight
# When I fill in the form with a flight number (assuming these will always be unique)
# And click submit
# I'm taken back to the passengers show page
# And I can see the flight number of the flight I just added
