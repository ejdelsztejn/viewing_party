require 'rails_helper'

RSpec.describe Friendship do
  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:friend) }
  end
  describe "class methods" do
    before(:each) do
      @jessye = User.create(name: "Jessye E", uid: "67890", email: "jessye@is.cool", token: "jessyes_token")
      @sienna = User.create(name: "Sienna K", uid: "12345", email: "cece@is.cool", token: "ceces_token")
    end
    it ".create_reciprocal_for_ids" do
      Friendship.create_reciprocal_for_ids(@sienna.id, @jessye.id)
      expect(@sienna.friends.first).to eq(@jessye)
      expect(@jessye.friends.first).to eq(@sienna)
    end
    it ".destroy_reciprocal_for_ids" do
      Friendship.create_reciprocal_for_ids(@sienna.id, @jessye.id)
      expect(@sienna.friends.first).to eq(@jessye)
      expect(@jessye.friends.first).to eq(@sienna)

      Friendship.destroy_reciprocal_for_ids(@sienna.id, @jessye.id)
      expect(@sienna.friends.first).to_not eq(@jessye)
      expect(@jessye.friends.first).to_not eq(@sienna)
    end
  end
end
