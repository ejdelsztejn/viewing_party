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
  end
end
