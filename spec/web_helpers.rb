def create_restaurant
  Restaurant.create(name: 'PizzaMamamia', description: "Italian Pizza", user_id: 1)
  visit '/restaurants'
end
