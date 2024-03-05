class Car < ApplicationRecord
  belongs_to :user

  def to_label
    model
  end
end
