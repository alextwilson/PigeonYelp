require 'rails_helper'

RSpec.describe Review, type: :model do
  subject(:review) {described_class.new(rating: 5, body: "Italian, Indian, Chinese Fusion! Wow! Fantastic!!!", restaurant_id: 104, user_id: 3245)}
  subject(:bad_review) {described_class.new(rating: 1, body: "Just a broccoli.")}

  context "Unsucessful review creation" do
    it "when no 'restaurant_id' is passed." do
      review = Review.new()
      expect(bad_review).to_not be_valid
    end

    it "when no 'user_id' is passed." do
      expect(bad_review).to_not be_valid
    end
  end

  context "Successful review creation" do
    it "contains a rating." do
      expect(review.rating).to be(5)
    end

    it "contains a body." do
      expect(review.body).to eq("Italian, Indian, Chinese Fusion! Wow! Fantastic!!!")
    end

    it "contains a 'restaurant_id'." do
      expect(review.restaurant_id).to be(104)
    end

    it "contains a 'user_id'." do
      expect(review.user_id).to be(3245)
    end
  end

end