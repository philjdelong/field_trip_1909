class PassengersController < ApplicationController

  def show
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    flight_number = params[:flight_number]
    flight = Flight.where(number: flight_number)

    @passenger.flights << flight
    redirect_to "/passengers/#{@passenger.id}"
  end
end
