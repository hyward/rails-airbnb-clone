class AddCityToCars < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :city, null: false, foreign_key: true
  end
end
