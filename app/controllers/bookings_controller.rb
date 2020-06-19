class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  def create
    start = nil
    end_date = nil
    start = params['startdate']&.split('to').first.strip unless params['startdate'].blank?
    end_date = params['startdate']&.split('to').last.strip unless params['startdate'].blank?
    @car = Car.find(params[:car_id])
    @booking = Booking.new(start_date: start, end_date: end_date, user: current_user, car: @car)
    if @booking.save
      redirect_to dashboard_path
    else
      render 'cars/show'
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
