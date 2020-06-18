class City < ApplicationRecord
  has_many :cars
  def self.all_cities
    all.map(&:name)
  end
end
