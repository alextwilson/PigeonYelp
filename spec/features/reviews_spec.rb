feature 'Reviews' do
  describe 'reviewing a restaurant' do
    scenario 'user cannot review their own restaurant' do
      user_login('lewis@gmail.com')
      create_restaurant
      click_link 'Show'
      expect(page).not_to have_content 'Add a review:'
    end

    scenario 'user leaves a review' do
      user_login('alex@gmail.com')
      create_restaurant
      click_link 'Logout'
      user_login('lewis@gmail.com')
      go_to_restaurant
      create_review
      expect(page).to have_content 'Really Bad'
      expect(page).to have_content 'by lewis@gmail.com'
    end
  end

  describe 'deleting a review' do
    scenario 'user can delete their own reviews' do
      user_login('alex@gmail.com')
      create_restaurant
      click_link 'Logout'
      user_login('lewis@gmail.com')
      go_to_restaurant
      create_review
      click_link 'Delete'
      expect(page).not_to have_content 'Really Bad'
    end

    scenario 'user cant delete other users reviews' do
      user_login('alex@gmail.com')
      create_restaurant
      click_link 'Logout'
      user_login('lewis@gmail.com')
      go_to_restaurant
      create_review
      click_link 'Logout'
      user_login('alex@gmail.com')
      go_to_restaurant
      expect(page).not_to have_content 'Delete'
    end
  end

  describe 'editing a review' do
    it 'a user can edit their own review' do
      user_login('alex@gmail.com')
      create_restaurant
      click_link 'Logout'
      user_login('lewis@gmail.com')
      go_to_restaurant
      create_review
      edit_review
      expect(page).to have_content 'Really Good'
      expect(page).not_to have_content 'Really Bad'
    end

    it 'a user cannot edit others\' reviews' do
      user_login('alex@gmail.com')
      create_restaurant
      click_link 'Logout'
      user_login('lewis@gmail.com')
      go_to_restaurant
      create_review
      click_link 'Logout'
      user_login('dra@gmail.com')
      go_to_restaurant
      expect(page).not_to have_content 'Edit Review'
    end
  end
end
