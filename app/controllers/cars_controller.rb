class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].nil?
      @cars = Car.all
    else
      @cars = Car.where("name iLike '%#{params[:query]}%'")
    end
  end

  def show
  end

  def new
  end

  def create
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end
  def car_params
    params.require(:car).permit(:name, :brand, :price)
  end
end
