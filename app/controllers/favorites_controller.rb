class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    @car = Car.find(params[:car_id])
    @favorite = Favorite.new(user_id: current_user.id, car_id: @car.id)
    if @favorite.save
      redirect_to car_path(@car)
      flash[:success] = 'Added to favorites!'
    else
      redirect_to car_path(@car)
      flash[:warning] = 'A problem occured'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to @favorite.car
    flash[:danger] = 'Removed from favorites'
  end

  private

end
