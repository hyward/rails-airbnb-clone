class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :updaet, :destroy]
  def index
    @cars = Car.all

    if params[:query].nil?
      @cars = Car.all
    else
      @cars = Car.where("name iLike '#{params[:query]}'")
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
    params.require(:car).permit(:name, :brand, :price)
  end
end
