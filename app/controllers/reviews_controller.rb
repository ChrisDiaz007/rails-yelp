class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    @review.restaurant = @restaurant
    authorize @review
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = current_user.reviews.new(review_params)
    @review.restaurant = @restaurant
    authorize @review
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
