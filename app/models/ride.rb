class Ride < ApplicationRecord
  belongs_to :event
  belongs_to :car
  has_many :passenger_requests
  has_many :users, through: :passenger_requests
  validates :departure_place, :arrival_place, :departure_time, presence: true
end
