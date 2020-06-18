class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @query = params[:query]
    if @query.present?
      @cars = Car.joins(:city).where("cities.name iLike ?", "%#{@query}%")
    else
      @cars = Car.all
    end
    # if @query.empty?
    #   @cars = Car.all
    # else
    #   @cars = Car.joins(:city).where("city.name iLike '%#{@query}%'")
    #   if City.all_cities.include?(@query)
    #   @city = City.where(name: params[:query].capitalize).first
    #   @cars = Car.where(city_id: @city.id)
    # else
    #   redirect_to root_url
    #     flash[:warning] = 'No city with that name'
    #   end
    # end
  end

  def show
    @booking = Booking.new
    @favorite = Favorite.find_by(car_id: @car.id)
    @markers = [{
        lat: @car.latitude,
        lng: @car.longitude,
        #infoWindow: render_to_string(partial: "info_window", locals: { car: @car })
        # js lowercamelCase the name of the key
      }]
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
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
    params.require(:car).permit(:name, :brand, :price, :transmission, :trunk, :seats, :city_id, :address, photos: [])
  end
end
