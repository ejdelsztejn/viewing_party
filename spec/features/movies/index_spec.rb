require 'rails_helper'

RSpec.describe 'find movies' do
  describe 'As an authenticated user' do
    before :each do
      visit '/'

      click_on 'Log In with Google'
    end

    it 'displays a button for finding top_rated movies and a search bar' do
      VCR.use_cassette('generic_movies') do
        visit "/movies"

        expect(page).to have_button("Discover Top-rated Movies")

        within ".search_form" do
          expect(page).to have_field(:keyword)
        end
      end
    end

    it 'I can link from the dashboard to the movies page' do
      VCR.use_cassette('generic_movies') do
        expect(current_path).to eq("/dashboard")

        click_on "Movies"

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
