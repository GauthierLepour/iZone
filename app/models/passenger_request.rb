class PassengerRequest < ApplicationRecord
  belongs_to :ride
  belongs_to :user

  def driver
    ride.car.user
  end
end
