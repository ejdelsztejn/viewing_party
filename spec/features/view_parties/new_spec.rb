require 'rails_helper'

RSpec.describe 'movie details page' do
  describe 'As an authenticated user' do
    before :each do
      visit '/'

      click_on 'Log In with Google'

      jessye = User.create(name: "Jessye E", uid: "67890", email: "jessye@is.cool", token: "jessyes_token")

      visit '/dashboard'

      fill_in :email, with: jessye.email
      click_on "Add Friend"
    end
    describe 'When I visit the movies page, and I click the button to create a viewing party' do
      it 'I should be redirected to a new viewing party form' do
        VCR.use_cassette('top_rated_movies, general_movie_details') do
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
    end
    describe 'When I visit the new viewing party page' do
      it 'I should see a form with the following' do
       # Movie Title (that is un-editable)
       # Duration of Party with a default value of movie runtime in minutes
       # When: as a date picker
       # Checkboxes next to each friend (if user has friends)
       # Button to create party
       VCR.use_cassette('top_rated_movies, general_movie_details') do
         visit '/movies/discover'

         expect(page).to have_button("Discover Top-rated Movies")
         click_on 'Discover Top-rated Movies'

         expect(page).to have_link('The Shawshank Redemption')
         click_on 'The Shawshank Redemption'

         expect(page).to have_content('The Shawshank Redemption')

         click_on 'Create Viewing Party'

         expect(page).to have_content('New Viewing Party')
         expect(page).to have_content('Movie title')
         expect(page).to have_content('Duration of party')
         expect(page).to have_content("Invite friends")
         expect(page).to have_content("Jessye E")
       end
     end
     xit 'If I fill out the form and submit it, I will create a new viewing party' do
       VCR.use_cassette('top_rated_movies, general_movie_details') do
         visit '/movies/discover'

         click_on 'Discover Top-rated Movies'
         click_on 'The Shawshank Redemption'
         click_on 'Create Viewing Party'

         fill_in 'Duration of party', with: 200
         #fill_in "Date and time", with: '2020-08-29T18:00'

         check('friend_ids[]', match: :first)

         click_on 'Create Viewing Party'

         expect(page).to have_content('Thank you for creating a viewing party')
       end
     end
    end
  end
end
