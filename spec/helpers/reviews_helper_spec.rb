require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReviewsHelper, type: :helper do
  describe '#new_or_update' do
    it 'creates a new review if @review is nil' do
      @restaurant = double("@restaurant")
      allow(@restaurant).to receive_message_chain("reviews.build")
      @review == nil
      expect(new_or_update).to eq @restaurant.reviews.build
    end

    it 'returns @review if not nil' do
      @review = 1
      expect(new_or_update).to eq 1
    end
  end
end
