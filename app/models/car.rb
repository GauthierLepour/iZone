class Car < ApplicationRecord
  belongs_to :user
  validates :brand, :model, :color, :license_plate, presence: true
  def to_label
    "#{brand} #{model}"
  end
end
