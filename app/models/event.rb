class Event < ApplicationRecord
  belongs_to :user
  has_many :rides

  validates :name, :start_time, :end_time, presence: true
  validates :name, length: { maximum: 20 }
  validate :end_date_after_start_date, :start_date_after_today

  private

  def end_date_after_start_date
    errors.add(:end_time, "must be after the start date") if end_time < start_time
  end

  def start_date_after_today
    errors.add(:start_time, "cannot be in the past") if start_time < Time.now
  end
end
