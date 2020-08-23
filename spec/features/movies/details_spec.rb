require 'rails_helper'

RSpec.describe 'movie details page' do
  describe 'As an authenticated user' do
    before :each do
      visit '/'

      click_on 'Log In with Google'
    end
    describe 'When I visit the movies page' do
      it "And I click on the movie title link, I should be redirected to the movie's details page" do
        visit '/movies/discover'

        expect(page).to have_button("Discover Top-rated Movies")
        click_on 'Discover Top-rated Movies'

        expect(page).to have_link('The Shawshank Redemption')
        click_on 'The Shawshank Redemption'

        # figure out how to test below
        # expect(current_path).to eq("/movies/#{shawshank_redemption.id}")
        expect(page).to have_content('The Shawshank Redemption')
      end
    end
    describe "When I visit the movie's detail page" do
      it 'I should see a button to create a viewing party,
          and I should see the following information' do

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
        # first 10 cast members
        # count of total reviews
        # each review author and information
        
      end
    end
  end
end
