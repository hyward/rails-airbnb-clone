class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @query = params[:query]
    if params[:query].empty?
      @cars = Car.all
    else
      @city = City.where(name: params[:query].capitalize).first
      @cars = Car.where(city_id: @city.id)
    end
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to @car
    else
      render :new
    end
  end
  private
  def set_car
    @car = Car.find(params[:id])
  end
  def car_params
    params.require(:car).permit(:name, :brand, :price, :transmission, :trunk, :seats, :city_id, photos: [])
  end
end
