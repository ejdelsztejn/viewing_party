require 'rails_helper'

RSpec.describe 'movie details page' do
  describe 'As an authenticated user' do
    before :each do
      visit '/'

      click_on 'Log In with Google'
    end
    describe 'When I visit the movies page' do
      it "And I click on the movie title link, I should be redirected to the movie's details page" do
        VCR.use_cassette('top_rated_movies, general_movie_details, movie_cast, movie_reviews') do
          visit '/movies/discover'

          expect(page).to have_button("Discover Top-rated Movies")
          click_on 'Discover Top-rated Movies'

          expect(page).to have_link('The Shawshank Redemption')
          click_on 'The Shawshank Redemption'

          expect(page).to have_content('The Shawshank Redemption')
        end
      end
    end
    describe "When I visit the movie's detail page" do
      it 'I should see a button to create a viewing party,
          and I should see the following information' do
        VCR.use_cassette('top_rated_movies, general_movie_details, movie_cast, movie_reviews') do
          visit '/movies/discover'

          expect(page).to have_button("Discover Top-rated Movies")
          click_on 'Discover Top-rated Movies'

          expect(page).to have_link('The Shawshank Redemption')
          click_on 'The Shawshank Redemption'

          expect(page).to have_content('The Shawshank Redemption')
          expect(page).to have_content('Vote average: 8.7')
          expect(page).to have_content('Runtime: 142 minutes')
          expect(page).to have_content('Genres: Drama, Crime')
          expect(page).to have_content('Summary: Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope')

          within '.cast' do
            expect(page).to have_content('Tim Robbins')
            expect(page).to have_content('Morgan Freeman')
            expect(page).to have_content('Bob Gunton')
            expect(page).to have_content('Clancy Brown')
            expect(page).to have_content('Mark Rolston')
            expect(page).to have_content('James Whitmore')
            expect(page).to have_content('Gil Bellows')
            expect(page).to have_content('William Sadler')
            expect(page).to have_content('Jeffrey DeMunn')
            expect(page).to have_content('Larry Brandenburg')
          end

          within '.reviews' do
            expect(page).to have_content('Number of Reviews: 6')
            expect(page).to have_content('Author: elshaarawy')
            expect(page).to have_content('Review: very good movie 9.5/10')
          end
        end 
      end
    end
  end
end
