class PagesController < ApplicationController
  def home
    @cars = Car.all.limit(6)
  end

  def dashboard
  end

  def favorites
  end

  def cars
  end
end
