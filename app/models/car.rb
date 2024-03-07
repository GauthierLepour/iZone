class Car < ApplicationRecord
  belongs_to :user

  def to_label
    "#{brand} #{model}"
  end
end
