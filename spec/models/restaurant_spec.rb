require 'rails_helper'

RSpec.describe Restaurant do
  it "restaurant is not valid without a title" do
    restaurant = Restaurant.new(name: nil, description: "This is my restaurant")
    expect(restaurant).to_not be_valid
  end
 

  it "create restaurant with a description" do
    restaurant = Restaurant.new(name: 'test', description: "My restaurant")
    expect(restaurant).to be_valid
  end
end
