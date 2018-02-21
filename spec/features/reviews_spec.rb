feature 'Reviews' do
  describe 'reviewing a restaurant' do
    scenario 'user cannot review their own restaurant' do
      user_login
      create_restaurant
      click_link 'Show'
      select "3", :from => "review[rating]"
      fill_in 'review[body]', with: 'Average'
      click_button 'Create Review'
      expect(page).to have_content 'You cannot leave a review for your own restaurant!'
    end
  end
end
