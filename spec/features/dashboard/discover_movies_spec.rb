require 'rails_helper'

RSpec.describe 'from the dashboard page' do
  describe 'go to movies' do
    it 'displays a button to view movies' do
      visit '/'

      click_on 'Log In with Google'

      expect(current_path).to eq('/dashboard')

      click_on "Movies"

      expect(current_path).to eq('/movies')
      expect(page).to have_content('Discover Movies')
    end
  end
end
