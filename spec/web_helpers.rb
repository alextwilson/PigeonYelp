def create_restaurant
  Restaurant.create(name: 'PizzaMamamia', description: "Italian Pizza", user_id: 1)
  visit '/restaurants'
end

def user_login(email)
  user = User.create email: email, password: 'password', password_confirmation: 'password'
  login_as user
end

def go_to_restaurant
  click_link 'All restaurants'
  click_link 'Show'
end

def create_review
  select "3", :from => "review[rating]"
  fill_in 'review[body]', with: 'Really Bad'
  click_button 'Create Review'
end

def edit_review
  click_link 'Edit Review'
  fill_in 'review[body]', with: 'Really Good'
  click_button 'Update Review'
end
