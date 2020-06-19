class Car < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
end
