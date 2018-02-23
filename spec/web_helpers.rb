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

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: "facebook",
      uid: "12345678910",
      info: {
        email: "test@gmail.com",
        first_name: 'Lewis',
        last_name: "Moore"
      },
      credentials: {
        token: "abcdefg§2345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now,
      }
    })
end
