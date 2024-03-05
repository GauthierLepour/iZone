class Ride < ApplicationRecord
  belongs_to :event
  belongs_to :car
end
