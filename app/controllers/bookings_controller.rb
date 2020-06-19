class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  def create
    if params['startdate'] == ''
      redirect_to car_path(@car)
    else
      start = params['startdate'].split('to').first.strip
      end_date = params['startdate'].split('to').last.strip
      car = Car.find(params[:car_id])
      booking = Booking.new(start_date: start, end_date: end_date, user: current_user, car: car)
      if booking.save
      redirect_to dashboard_path
    else
      render 'cars/show'
    end
  end
end
  def edit
  end

  def update
    @booking.update(status: 'confirmed')
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
