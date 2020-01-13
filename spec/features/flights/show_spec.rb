require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when i visit a flights show page", type: :feature do
    before :each do
      @southwest = Airline.create(name: "Southwest")

      @flight_1 = @southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      @flight_2 = @southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")

      @jeff = Passenger.create(
        name: 'Jeff',
        age:  31
      )

      @phil = Passenger.create(
        name: 'Phil',
        age:  29
      )

      @courtney = Passenger.create(
        name: 'Courtney',
        age:  28
      )

      @capo = Passenger.create(
        name: 'Capo',
        age:  7
      )

      @flight_1.passengers << [@phil, @courtney, @capo]
      @flight_2.passengers << @jeff

      visit "/flights/#{@flight_1.id}"
    end

    it "i see all flight info" do
      expect(page).to_not have_content('SW2')

      expect(page).to have_content('SW1')
      expect(page).to have_content('10/10/20')
      expect(page).to have_content('1300')
      expect(page).to have_content('Minneapolis')
      expect(page).to have_content('Nashville')
    end

    it "i see the airline name" do
      expect(page).to have_content('Southwest')
    end

    it "i see all passenger names" do
      expect(page).to have_content('Phil')
      expect(page).to have_content('Courtney')
    end

    it "i can see minors count and adults count" do
      expect(page).to have_content('Adults: 2')
      expect(page).to have_content('Minors: 1')
    end
  end
end

# As a visitor
# When I visit a flights show page
# I see the number of minors on the flight (minors are any passengers that are under 18)
# And I see the number of adults on the flight (adults are any passengers that are 18 or older)
