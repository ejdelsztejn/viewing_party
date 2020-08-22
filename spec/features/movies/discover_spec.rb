require 'rails_helper'

RSpec.describe 'discover movies page' do
  describe 'As an authenticated user' do
    it 'I can link to the discover page from the dashboard' do
      visit '/'

      click_on 'Log In with Google'

      expect(current_path).to eq('/dashboard')

      expect(page).to have_link("Discover Movies")
      click_on "Discover Movies"

      expect(current_path).to eq("/movies/discover")
    end
  end
end
