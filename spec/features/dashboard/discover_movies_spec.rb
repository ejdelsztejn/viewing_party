require 'rails_helper'

RSpec.describe 'from the dashboard page' do
  describe 'go to discover movies' do
    it 'displays a button to discover movies, a friends section, and a viewing parties section' do
      visit '/'

      click_on 'Log In with Google'

      expect(current_path).to eq('/dashboard')

      click_on "Discover Movies"

      expect(current_path).to eq('/movies')
      expect(page).to have_content('Discover Movies')
    end
  end
end
