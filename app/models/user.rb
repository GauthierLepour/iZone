class User < ApplicationRecord
  has_one_attached :photo
  has_many :orders
  has_many :cars
  has_many :notifications
  has_many :memberships, dependent: :destroy
  has_many :events, through: :memberships
  validates :photo, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
