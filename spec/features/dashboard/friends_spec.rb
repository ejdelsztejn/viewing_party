require 'rails_helper'

RSpec.describe 'user dashboard friends section' do

  describe 'As an authenticated user, I see a section for friends' do
    it "there should be a text field to enter a friend's email and a button to 'Add Friend'" do
      visit '/'

      click_on 'Log In with Google'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Friends")
    end

    it 'If I have not added any friends there should be a message. "You currently have no friends".' do
      visit '/'

      click_on 'Log In with Google'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("You currently have no friends")
    end

    it 'If I have added friends, I should see a list of all my friends.' do
      jessye = User.create(name: "Jessye E", uid: "67890", email: "jessye@is.cool", token: "jessyes_token")

      visit '/'

      click_on 'Log In with Google'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("You currently have no friends")

      fill_in :email, with: jessye.email
      click_on "Add Friend"
      expect(page).to have_content("Jessye E")
    end

    
  end
end
