require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when i visit a flights show page", type: :feature do
    before :each do
      @southwest = Airline.create(name: "Southwest")

      @flight_1 = @southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      @flight_2 = @southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")

      @phil = Passenger.create(
        name: 'Phil',
        age:  29
      )

      @courtney = Passenger.create(
        name: 'Courtney',
        age:  28
      )

      @flight_1.passengers << [@phil, @courtney]

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
  end
end
