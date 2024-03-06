class Event < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :rides
  has_secure_token :invite_token
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  validates :name, :start_time, :end_time, :photo, presence: true
  validates :name, length: { maximum: 20 }
  validate :end_date_after_start_date, :start_date_after_today

  def member?(user)
    users.include?(user)
  end

  def to_param
    invite_token
  end

  private

  def end_date_after_start_date
    errors.add(:end_time, "must be after the start date") if end_time < start_time
  end

  def start_date_after_today
    errors.add(:start_time, "cannot be in the past") if start_time < Time.now
  end
end
