feature 'Redirect' do
  describe 'new restaurant' do
    it 'redirects to login page if user is not signed in' do
      visit '/restaurants'
      click_link 'New restaurant'
      expect(current_path).to eq '/users/sign_in'
    end
  end
end
