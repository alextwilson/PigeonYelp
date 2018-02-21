class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    redirect_to restaurant_path(@restaurant)
  end

  private
    def review_params
      params.require(:review).permit(:rating, :body, :user_id)
    end
end
