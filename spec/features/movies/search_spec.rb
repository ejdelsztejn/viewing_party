require 'rails_helper'

RSpec.describe 'search movies by keyword' do
  describe 'As an authenticated user' do
    before :each do
      visit '/'

      click_on 'Log In with Google'
    end
    it 'I can visit the discover page and make a search for movies that match a keyword' do
      VCR.use_cassette('search_movies') do
        visit '/movies/discover'

        within ".search_form" do
          fill_in :keyword, with: "fight"
          click_on "Find Movies"
        end

        expect(current_path).to eq("/movies")

        expect(page).to have_css(".movie", count: 20)

        within(first(".movie")) do
          expect(page).to have_css(".title")
          name = find('.title').text
          expect(name).not_to be_empty

          expect(page).to have_link(find('.title-movie').text)

          expect(page).to have_css(".vote_average")
          name = find('.vote_average').text
          expect(name).not_to be_empty
        end
      end
    end
  end
end
