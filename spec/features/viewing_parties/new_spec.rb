require 'rails_helper'

RSpec.describe 'movie details page' do
  describe 'As an authenticated user' do
    before :each do
      visit '/'

      click_on 'Log In with Google'
    end
    describe 'When I visit the movies page, and I click the button to create a viewing party' do
      it 'I should be redirected to a new viewing party form' do
        visit '/movies/discover'

        expect(page).to have_button("Discover Top-rated Movies")
        click_on 'Discover Top-rated Movies'

        expect(page).to have_link('The Shawshank Redemption')
        click_on 'The Shawshank Redemption'

        expect(page).to have_content('The Shawshank Redemption')

        click_on 'Create Viewing Party'
        expect(page).to have_content('New Viewing Party')
      end
    end
    describe 'When I visit the new viewing party page' do
      it 'I should see a form with the following' do
       # Movie Title (that is un-editable)
       # Duration of Party with a default value of movie runtime in minutes
       # When: as a date picker
       # Checkboxes next to each friend (if user has friends)
       # Button to create party
       visit '/movies/discover'

       expect(page).to have_button("Discover Top-rated Movies")
       click_on 'Discover Top-rated Movies'

       expect(page).to have_link('The Shawshank Redemption')
       click_on 'The Shawshank Redemption'

       expect(page).to have_content('The Shawshank Redemption')

       click_on 'Create Viewing Party'

       expect(page).to have_content('New Viewing Party')
       expect(page).to have_content('Movie Title: The Shawshank Redemption')
       expect(page).to have_content('Duration of Party: 142 minutes')
     end
    end
  end
end
