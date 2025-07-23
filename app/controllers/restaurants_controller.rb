class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @restaurants = Restaurant.all
  end

  def show

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'Restaurant was not created.'
    end
  end

  def edit

  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity, alert: 'Restaurant was not updated.'
    end
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
