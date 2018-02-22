require 'rails_helper'

RSpec.describe Restaurant do
  subject(:restaurant) {described_class.new(name: "PizzaTown", description: "We sell Chinese food!")}

  it "restaurant is not valid without a title" do
    restaurant = Restaurant.new(name: nil, description: "This is my restaurant")
    expect(restaurant).to_not be_valid
  end

  context "Successful resturant creation" do
    it "has a name" do
      expect(restaurant.name).to eq("PizzaTown")
    end

    it "has a description" do
      expect(restaurant.description).to eq("We sell Chinese food!")
    end
  end
end
