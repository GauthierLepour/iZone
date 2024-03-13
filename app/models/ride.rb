class Ride < ApplicationRecord
  monetize :price_cents
  belongs_to :event
  belongs_to :car
  has_many :passenger_requests, dependent: :destroy
  has_many :users, through: :passenger_requests
  has_one :chatroom
  validates :departure_place, :arrival_place, :departure_time, :seats, :price, presence: true

  geocoded_by :address_to_geocode
  after_validation :geocode, if: :will_save_change_to_departure_place?
  after_validation :geocode, if: :will_save_change_to_arrival_place?

  def address_to_geocode
    if event.address == departure_place
      arrival_place
    else
      departure_place
    end
  end

  def display_adress(address)
    if address.size > 30
      address.split(" - ")[0].size > 20 ? "#{address.split(" - ")[0].slice(0..20)}": address.split(" - ")[0]
    else
      address
    end
  end
end
