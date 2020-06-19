class City < ApplicationRecord
  has_many :cars, dependent: :destroy
  def self.all_cities
    all.map(&:name)
  end
end
