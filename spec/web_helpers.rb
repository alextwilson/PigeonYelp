def create_restaurant
  Restaurant.create(name: 'PizzaMamamia', description: "Italian Pizza", user_id: 1)
  visit '/restaurants'
end

def user_login
  user = User.create email: 'lewis@gmail.com', password: 'password', password_confirmation: 'password'
  login_as user
end
