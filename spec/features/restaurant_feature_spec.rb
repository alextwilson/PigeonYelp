require 'rails_helper'

feature 'restaurants' do

  before do
  user = User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
  login_as user
end

  context 'no restaurants displayed on the page' do
    scenario 'should have option to add a restaurant' do
    visit '/restaurants'
    expect(page).to have_content 'Listing restaurants'
    expect(page).to have_link 'New restaurant'
    end
end

  context 'restaurants are added' do
    scenario 'display the restaurants' do
    Restaurant.create(name: 'PizzaMamamia', description: "Italian Pizza", user_id: 1)
    visit '/restaurants'
    expect(page).to have_content('PizzaMamamia')
    expect(page).to have_link 'Show'
    end
  end

  context 'restaurants can be deleted' do
    scenario 'not display the deleted restaurant' do
    Restaurant.create(name: 'PizzaMamamia', description: "Italian Pizza", user_id: 1)
    visit '/restaurants'
    click_link 'Destroy'
    expect(page).not_to have_content('PizzaMamamia')
    end
  end


  context 'restaurants can be shown' do
    scenario 'display the restaurant details' do
    Restaurant.create(name: 'PizzaMamamia', description: "Italian Pizza", user_id: 1)
    visit '/restaurants'
    click_link 'Show'
    expect(page).to have_content('PizzaMamamia')
    expect(page).not_to have_content('German Pizza')
    expect(page).to have_link 'Back'
    end
  end

  context 'can be created' do
    scenario 'fill in the form with the restaurant name and description' do
    Restaurant.create(name: 'Name', description: 'Description', user_id: 1)
    visit '/restaurants'
    click_link 'New restaurant'
    fill_in 'restaurant[name]', with: 'Great Pasta'
    fill_in 'restaurant[description]', with: 'The best pasta from Portugal'
    click_button 'Create Restaurant'
    expect(page).to have_content 'Great Pasta'
    end
  end

  context 'gives invalid restaurant' do
    scenario 'does not let you submit a name that is less than 1 character' do
    visit '/restaurants'
    click_link 'New restaurant'
    fill_in 'restaurant[name]', with: ''
    click_button 'Create Restaurant'
    expect(page).to have_content 'error'
    end
  end

end
