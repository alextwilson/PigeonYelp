feature 'User' do

  before do
    user_login('lewis@gmail.com')
  end

  describe 'can see a message welcome with' do
    scenario 'the email address when logged in' do
      visit '/'
      user_login('lewis@gmail.com')
      expect(page).to have_content 'Welcome, lewis@gmail.com!'
    end
  end
end
