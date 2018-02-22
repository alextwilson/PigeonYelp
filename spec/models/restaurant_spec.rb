require 'rails_helper'

RSpec.describe Restaurant do
  subject(:restaurant) {described_class.new(name: "PizzaTown", description: "We sell Chinese food!", user_id: 22)}

  context "Unsuccessful resturant creation" do

    it "without a 'name'" do
      restaurant = Restaurant.new(name: nil, description: "We only sell broccoli.", user_id: 1)
      expect(restaurant).to_not be_valid
    end

    it "without a 'user_id'" do
      restaurant = Restaurant.new(name: "BroccoliTown", description: "We only sell broccoli.", user_id: nil)
      expect(restaurant).to_not be_valid
    end

  end

  context "Successful resturant creation" do

    it "has a 'name'" do
      expect(restaurant.name).to eq("PizzaTown")
    end

    it "has a 'description'" do
      expect(restaurant.description).to eq("We sell Chinese food!")
    end

    it "has a 'user_id'" do
      expect(restaurant.user_id).to be(22)
    end
  end

end
