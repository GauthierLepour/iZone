class User < ApplicationRecord
  has_many :cars
  has_many :memberships, dependent: :destroy
  has_many :events, through: :memberships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
