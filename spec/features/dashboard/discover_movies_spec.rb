require 'rails_helper'

RSpec.describe 'from the dashboard page' do
  describe 'go to movies' do
    it 'displays a button to view movies' do
      # json_response = File.read('spec/fixtures/generic_movies.json')
      # stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['MOVIES_API_KEY']}&language=en-US&page=1").
      #   to_return(status: 200, body: json_response)
      VCR.use_cassette('generic_movies') do
        visit '/'

        click_on 'Log In with Google'

        expect(current_path).to eq('/dashboard')

        click_on "Movies"

        expect(current_path).to eq('/movies')
        expect(page).to have_content('Discover Movies')
      end
    end
  end
end
