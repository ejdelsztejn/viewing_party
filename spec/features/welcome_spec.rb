require 'rails_helper'

RSpec.describe 'Welcome Page' do
  describe 'As a user' do
    it 'I see a welcome page with a brief description of the application' do
      visit '/'

      expect(page).to have_content('Welcome to Viewing Party')
      expect(page).to have_content('Viewing Party is an application in which users can explore movie options and create a viewing party event for themselves and their friends')
    end
  end
end
