class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

  redirect_to @car
  end



  private

  def user_params
    params.require(:user).permit(:name, :address, :email, :phone_number)
  end

end


# # t.string "name"
# #     t.integer "phone_number"
# #     t.string "address"
# #     t.string "avatar"
# email
