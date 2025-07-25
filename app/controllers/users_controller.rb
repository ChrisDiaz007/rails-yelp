class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @restaurants = @user.restaurants
    @reviews = @user.reviews
    authorize @user
  end
end
