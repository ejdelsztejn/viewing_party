require 'rails_helper'

RSpec.describe 'user dashboard page' do
  before(:each) do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :uid => 'mock_uid',
      :info => {
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

    expect(page).to have_content("Welcome, mock_user_email")
    expect(page).to have_css('section.friends')
    expect(page).to have_css('section.viewing-parties')
  end 
end
