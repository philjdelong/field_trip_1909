class Flight <ApplicationRecord
  validates_presence_of :number, :date, :time, :departure_city, :arrival_city

  belongs_to :airline

  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  def adult_passengers
    x = passengers.where('age >= 18')
    x.length
  end

  def minor_passengers
    x = passengers.where('age < 18')
    x.length
  end
end
