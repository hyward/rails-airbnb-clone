class City < ApplicationRecord

  def self.all_cities
    all.map(&:name)
  end
end
