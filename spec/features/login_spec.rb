require 'rails_helper'

RSpec.describe 'Login' do
  describe 'As a user' do
    describe 'When I visit the root path' do
      before(:each) do
        OmniAuth.config.mock_auth[:google_oauth2] = nil
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          :uid => 'mock_uid',
          :info => {
            :name => 'Mock User'
            :email => 'mock_user_email'
          },
          :credentials => {
            :token => 'mock_token'
          }
        })
      end
      it 'I should see a button to Log In with Google' do
        visit '/'

        expect(page).to have_button('Log In with Google')
      end
      it 'When I login, I should redirect to the dashboard' do
        visit '/'

        expect(page).to have_button('Log In with Google')
        click_on 'Log In with Google'
        expect(current_path).to eq('/dashboard')
        expect(page).to have_content("Welcome, mock_user_email")
      end
    end
  end
end
