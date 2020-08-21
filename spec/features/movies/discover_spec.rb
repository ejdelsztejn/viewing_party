require 'rails_helper'

RSpec.describe 'discover movies page' do
  describe 'As an authenticated user' do
    it 'I should see a button to discover top-rated movies' do
      visit '/'

      click_on 'Log In with Google'

      expect(current_path).to eq('/dashboard')

      click_on "Discover Movies"

      expect(current_path).to eq('/movies')
      expect(page).to have_button('Discover Top-rated Movies')
      expect(page).to have_content('Enter a keyword:')
      expect(page).to have_button('Find Movies')
    end
  end
end
