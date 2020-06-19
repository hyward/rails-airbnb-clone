class Car < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
