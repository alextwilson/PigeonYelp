require 'rails_helper'

RSpec.describe Restaurant do
  it "restaurant is not valid without a title" do
    restaurant = Restaurant.new(name: nil, description: "This is my restaurant")
    expect(restaurant).to_not be_valid
  end
end
