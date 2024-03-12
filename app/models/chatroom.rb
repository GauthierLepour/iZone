class Chatroom < ApplicationRecord
  belongs_to :ride
  has_many :messages
end
