class Car < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :favorites
  has_many :bookings
  has_many_attached :photos
end
