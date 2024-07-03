class ReviewsController < ApplicationController
  # Other actions...

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'  # Render the show template of restaurants controller
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
