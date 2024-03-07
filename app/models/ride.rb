class Ride < ApplicationRecord
  belongs_to :event
  belongs_to :car
  has_many :passenger_requests
  has_many :users, through: :passenger_requests
  validates :departure_place, :arrival_place, :departure_time, presence: true

  geocoded_by :departure_place
  after_validation :geocode, if: :will_save_change_to_departure_place?


  #after_validation :conditionally_geocode
#
  #private
#
  #def conditionally_geocode
  #  if event.address == departure_place
  #    geocoded_by :arrival_place
  #    geocode if will_save_change_to_arrival_place?
  #  else
  #    geocoded_by :departure_place
  #    geocode if will_save_change_to_departure_place?
  #  end
  #end
end
