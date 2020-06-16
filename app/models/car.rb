class Car < ApplicationRecord
  belongs_to :city
  has_many_attached :photos
end
