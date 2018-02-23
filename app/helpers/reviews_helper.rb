module ReviewsHelper
  def new_or_update
    if @review == nil
      @restaurant.reviews.build
    else
      @review
    end
  end
end
