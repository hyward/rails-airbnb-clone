class PagesController < ApplicationController
  def home
    @cars = Car.all.limit(6)
  end

  def dashboard
    @bookings = current_user.bookings
    @cars = current_user.cars
  end

  def favorites
  end

  def cars
  end
end
