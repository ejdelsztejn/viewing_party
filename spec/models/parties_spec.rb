require 'rails_helper'

RSpec.describe Party do
  describe 'validations' do
    it {should validate_presence_of :movie_title}
    it {should validate_presence_of :duration_of_party}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
  end

  describe 'relationships' do
    it { should belong_to(:user)}
    it { should have_many(:invitations)}
  end
end
