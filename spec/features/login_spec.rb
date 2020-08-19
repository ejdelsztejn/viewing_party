require 'rails_helper'

RSpec.describe 'Login' do
  describe 'As a user' do
    describe 'When I visit the root path' do
      before(:each) do
        require "pry"; binding.pry
      end
      it 'I should see a button to Log In with Google' do
        visit '/'

        expect(page).to have_content('Welcome to Viewing Party')
      end
    end
  end
end
