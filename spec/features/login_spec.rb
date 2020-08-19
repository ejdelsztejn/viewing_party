require 'rails_helper'

RSpec.describe 'Login' do
  describe 'As a user' do
    describe 'When I visit the root path' do
      before(:each) do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
          :uid => 'mock_uid',
          :info => {
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
    end
  end
end
