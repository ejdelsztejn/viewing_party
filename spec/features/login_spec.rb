require 'rails_helper'

RSpec.describe 'Login' do
  describe 'As a user' do
    describe 'When I visit the root path' do
      it 'I should see a button to Log In with Google' do
        visit '/'

        expect(page).to have_button('Log In with Google')
      end
      it 'When I login, I should redirect to the dashboard' do
        visit '/'

        expect(page).to have_button('Log In with Google')
        click_on 'Log In with Google'
        expect(current_path).to eq('/dashboard')
        expect(page).to have_content("Welcome, Mock User")
      end
    end
  end
end
