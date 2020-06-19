class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :status, inclusion: { in: ['pending', 'rejected', 'confirmed']}
  validates :start_date, presence: true
  validates :end_date, presence: true
end