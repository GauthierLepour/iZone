class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :passenger_request

  def sender
    if user == passenger_request.user
      passenger_request.driver
    else
      passenger_request.user
    end
  end
end
