class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @restaurants = policy_scope(Restaurant).all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end

  end

  def show
    authorize @restaurant
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'Restaurant was not created.'
    end
  end

  def edit
    authorize @restaurant
  end

  def update
    authorize @restaurant
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity, alert: 'Restaurant was not updated.'
    end
  end

  def destroy
    authorize @restaurant
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
