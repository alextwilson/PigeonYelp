class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)

    redirect_to restaurant_path(@restaurant)
  end

  def edit
    @review = Review.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    @review = Review.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])

    if @review.update(review_params)
			redirect_to @restaurant
		else
			render 'edit'
		end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(params[:restaurant_id])
  end

  private
    def review_params
      params.require(:review).permit(:rating, :body, :user_id)
    end
end
