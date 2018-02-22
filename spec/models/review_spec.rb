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

end