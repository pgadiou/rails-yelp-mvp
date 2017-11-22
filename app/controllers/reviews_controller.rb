class ReviewsController < ApplicationController

  def new
    # we need @restaurant in our `simple_form_for`

    @review = Review.new
    @review.restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    # @restaurant = @review.restaurant
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
