require 'rails_helper'

RSpec.describe 'user dashboard page' do
  it 'displays a button to discover movies, a friends section, and a viewing parties section' do
    visit '/'

    click_on 'Log In with Google'
    expect(current_path).to eq('/dashboard')

    expect(page).to have_content("Welcome, Mock User")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_css('section.friends')
    expect(page).to have_css('section.viewing-parties')
  end
end
