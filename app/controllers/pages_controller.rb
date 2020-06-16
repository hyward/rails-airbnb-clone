class PagesController < ApplicationController
  def home
    @cars = Car.all.limit(6)
  end
end
