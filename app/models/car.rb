class Car < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many_attached :photos
end
