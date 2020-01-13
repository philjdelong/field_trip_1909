# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
southwest = Airline.create(name: "Southwest")

flight_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
flight_2 = southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Denver", arrival_city: "Oakland")
flight_3 = southwest.flights.create(number: "SW3", date: "12/09/19", time: "0800", departure_city: "Columbus", arrival_city: "Louisville")
flight_4 = southwest.flights.create(number: "SW4", date: "12/10/19", time: "0700", departure_city: "Baltimore", arrival_city: "Portland")

flight_5 = southwest.flights.create(number: "SW5", date: "12/11/19", time: "0600", departure_city: "Tampa", arrival_city: "Denver")

phil = Passenger.create(
  name: 'Phil',
  age:  29
)

courtney = Passenger.create(
  name: 'Courtney',
  age:  28
)

flight_1.passengers << phil
flight_2.passengers << phil
flight_4.passengers << phil
