require 'rails_helper'

RSpec.describe 'discover movies page' do
  describe 'As an authenticated user' do
    it 'I should see a button to discover top-rated movies' do
      visit '/'

      click_on 'Log In with Google'

      expect(current_path).to eq('/dashboard')

      within 'nav' do
        expect(page).to have_button('Discover Top-rated Movies')
        expect(page).to have_content('Keyword')
        expect(page).to have_button('Find Movies')
      end

      click_on "Discover Movies"

      expect(current_path).to eq('/movies')

      save_and_open_page
    end
  end
end
