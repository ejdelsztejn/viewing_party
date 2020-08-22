require 'rails_helper'

RSpec.describe 'find top_rated movies' do
  describe 'As an authenticated user' do
    it 'I can visit the discover page and make a request for top rated movie results' do
      visit '/movies/discover'

      click_on "Discover Top-rated Movies"

      expect(current_path).to eq("/movies")

      expect(page).to have_css(".movie", count: 40)

      within(first(".movie")) do
        expect(page).to have_css(".title")
        name = find('.title').text
        expect(name).not_to be_empty

        ## Not sure how to call this as a link because the movie obj aren't being saved to the DB
        # expect(page).to have_link(find('.title').text)

        expect(page).to have_css(".vote_average")
        name = find('.vote_average').text
        expect(name).not_to be_empty
      end
    end
  end
end
