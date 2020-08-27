require 'rails_helper'

RSpec.describe 'user dashboard page' do
  before :each do
    visit '/'

    click_on 'Log In with Google'
    expect(current_path).to eq('/dashboard')
  end
  it 'displays a button to discover movies, a friends section, and a viewing parties section' do
    expect(page).to have_content("Welcome, Mock User")
    expect(page).to have_button("Movies")
    expect(page).to have_css('section.friends')
    expect(page).to have_css('section.viewing-parties')
  end

  it 'displays viewing parties I have been invited to' do
    jessye = User.create(name: "Jessye E", uid: "67890", email: "jessye@is.cool", token: "jessyes_token")

    fill_in :email, with: jessye.email
    click_on "Add Friend"

    current_user = User.create(
      name: OmniAuth.config.mock_auth[:google_oauth2][:info][:name],
      uid: OmniAuth.config.mock_auth[:google_oauth2][:uid],
      email: OmniAuth.config.mock_auth[:google_oauth2][:info][:email],
      token: OmniAuth.config.mock_auth[:google_oauth2][:credentials][:token]
      )

    viewing_party_1 = jessye.parties.create(
      movie_title: 'Spirited Away',
      duration_of_party: '125',
      friend_ids: [current_user.id],
      start_time: "2020-09-03T18:24"
    )

    visit '/dashboard'

    save_and_open_page
    within '.invitations' do
      expect(page).to have_content('Spirited Away')
      expect(page).to have_content('Thu, 03 Sept 2020 18:24:00 UTC +00:00,')
      expect(page).to have_button('Add to Calendar')
    end
  end

  xit 'displays the viewing parties i have created' do
    jessye = User.create(name: "Jessye E", uid: "67890", email: "jessye@is.cool", token: "jessyes_token")

    fill_in :email, with: jessye.email
    click_on "Add Friend"

    VCR.use_cassette('top_rated_movies, general_movie_details') do
      visit '/movies/discover'

      click_on 'Discover Top-rated Movies'
      click_on 'The Shawshank Redemption'
      click_on 'Create Viewing Party'

      fill_in 'Duration of party', with: 200
      fill_in 'Date and time', with: '2020-08-29'
      fill_in 'Time', with: '18:00'
      check('friend_ids[]', match: :first)

      click_on 'Create Viewing Party'

      expect(page).to have_content('Thank you for creating a viewing party')
    end

    visit '/dashboard'

    within '.created' do
      expect(page).to have_content('The Shawshank Redemption')
      expect(page).to have_content('Thu, 29 Aug 2020 18:00:00 UTC +00:00,')
    end
  end
end
