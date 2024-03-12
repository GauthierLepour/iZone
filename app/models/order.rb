class Order < ApplicationRecord
  belongs_to :user
  belongs_to :ride
  monetize :amount_cents
end
