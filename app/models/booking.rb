class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :status, inclusion: { in: ['pending', 'rejected', 'confirmed']}
end
