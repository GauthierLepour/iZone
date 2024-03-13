class Event < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :rides, dependent: :destroy
  has_many :passenger_requests, through: :rides
  has_secure_token :invite_token
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  validates :name, :start_time, :end_time, :address, :description, :photo, presence: true
  validates :name, length: { maximum: 20 }
  validate :end_date_after_start_date, :start_date_after_today

  def member?(user)
    users.include?(user)
  end

  def to_param
    invite_token
  end

  def confirmed_rides(current_user)
    my_requests = passenger_requests.where(user: current_user)
    my_accepeted_request = my_requests.select { |pr| pr.status == "accept" }
    return my_accepeted_request.map(&:ride)
  end

  def display_adress(address)
    if address.size > 30
      address.split(" - ")[0].size > 20 ? "#{address.split(" - ")[0].slice(0..20)}": address.split(" - ")[0]
    else
      address
    end
  end

  private

  def end_date_after_start_date
    if end_time && start_time
      errors.add(:end_time, "must be after the start date") if end_time < start_time
    end
  end

  def start_date_after_today
    if start_time
      errors.add(:start_time, "cannot be in the past") if start_time < Time.now
    end
  end
end
