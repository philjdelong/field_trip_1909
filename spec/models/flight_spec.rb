require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
  end
  describe 'relationships' do
    it {should belong_to :airline}
  end

  describe 'methods' do
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

    end

    it "count adults and minors on flight" do
      expect(@flight_1.adult_passengers).to eq(2)
      expect(@flight_1.minor_passengers).to eq(1)
    end
  end
end
