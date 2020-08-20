require 'rails_helper'

RSpec.describe 'from the dashboard page' do
  describe 'go to discover movies' do
    before(:each) do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        :uid => 'mock_uid',
        :info => {
          :name => "Mock User",
          :email => 'mock_user_email'
        },
        :credentials => {
          :token => 'mock_token'
        }
      })
    end
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
