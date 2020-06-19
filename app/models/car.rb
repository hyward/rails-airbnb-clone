class Car < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :favorites
  has_many :bookings
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true
  validates :brand, presence: true
  validates :seats, presence: true
  validates :transmission, presence: true
  validates :trunk, presence: true
  validates :city, presence: true
  validates :user, presence: true
  validates :address, presence: true
end
