require 'rails_helper'

feature 'User logs in with Facebook' do
  scenario 'user sees sign in with facebook link' do
    visit root_path
    expect(page).to have_link("Sign in with Facebook")
  end

  scenario 'user successfully logs in with facebook' do
    stub_omniauth
    visit root_path
    click_link 'Sign in with Facebook'
    expect(page).to have_link('Logout')
  end
end
