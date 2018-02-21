feature 'Reviews' do
  describe 'reviewing a restaurant' do
    scenario 'user cannot review their own restaurant' do
      user_login('lewis@gmail.com')
      create_restaurant
      click_link 'Show'
      expect(page).not_to have_content 'Add a review:'
    end
    scenario 'user can delete their own reviews' do
      user_login('alex@gmail.com')
      create_restaurant
      click_link 'Show'
      click_link 'Logout'
      user_login('lewis@gmail.com')
      click_link 'All restaurants'
      click_link 'Show'
      select "3", :from => "review[rating]"
      fill_in 'review[body]', with: 'Really Bad'
      click_button 'Create Review'
      click_link 'Delete'
      expect(page).not_to have_content 'Really Bad'
    end
  end
end
