class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    @car = Car.find(params[:car_id])
    @favorite = Favorite.new(user_id: current_user.id, car_id: @car.id)
    if @favorite.save
      redirect_to car_path(@car)
      flash[:success] = 'Added to favorites'
    else
      redirect_to car_path(@car)
      flash[:warning] = 'A problem occured'
    end
  end

  private

  def fav_params
    params.require(:favorite).permit(:user_id, :car_id)
  end
end