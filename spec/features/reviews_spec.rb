feature 'Reviews' do
  describe 'reviewing a restaurant' do
    scenario 'user cannot review their own restaurant' do
      user_login
      create_restaurant
      click_link 'Show'
      expect(page).not_to have_content 'Add a review:'
    end
  end
end
