require 'rails_helper'

feature 'restaurants' do
    context 'no restaurants displayed on the page' do
        scenario 'should have option to add a restaurant' do
            visit '/restaurants'
            expect(page).to have_content 'Listing restaurants'
            expect(page).to have_link 'New restaurant'
        end
    end

    context 'restaurants are added' do
        scenario 'display the restaurants' do
            Restaurant.create(name: 'PizzaMamamia', description: "Italian Pizza" )
            visit '/restaurants'
            expect(page).to have_content('PizzaMamamia')
            expect(page).not_to have_content('German Pizza')
            expect(page).to have_link 'Show'
        end
    end

    context 'restaurants can be shown' do
        scenario 'display the restaurant details' do
            Restaurant.create(name: 'PizzaMamamia', description: "Italian Pizza" )
            visit '/restaurants'
            click_link 'Show'
            expect(page).to have_content('PizzaMamamia')
            expect(page).not_to have_content('German Pizza')
            expect(page).to have_link 'Back'
        end
    end

    context 'can be created' do
        scenario 'fill in the form with the restaurant name and description' do
          Restaurant.create(name: 'Name', description: 'Description' )
          visit '/restaurants'
          click_link 'New restaurant'
          fill_in 'Name', with: 'Great Pasta'
          fill_in 'Description', with: 'The best pasta from Portugal'
          click_button 'Save Restaurant'
          expect(page).to have_content 'Great Pasta'
          expect(current_path).to eq '/restaurants'
        end
    end

    context 'gives invalid restaurant' do
           scenario 'does not let you submit a name that is less than 1 character' do
               visit '/restaurants'
               click_link 'New restaurant'
               fill_in 'Name', with: ''
               click_button 'Save Restaurant'
               expect(page).not_to have_content ''
               expect(page).to have_content 'error'
           end
       end

end
