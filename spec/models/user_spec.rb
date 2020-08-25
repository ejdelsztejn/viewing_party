require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it {should validate_presence_of :uid}
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_presence_of :token}
  end

  describe 'relationships' do
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many(:parties)}
    it { should have_many(:invitations)}
  end

  describe 'methods' do
    before :each do
      @response = {
        :uid => '12345',
        :info => {
          :name => 'Jessye Ejdelman',
          :email => 'jessye@code.com'
        },
        :credentials => {
          :token => 'test_token'
        }
      }
    end

    it '.from_omniauth' do
      user = User.from_omniauth(@response)
      expect(user.uid).to eq('12345')
      expect(user.name).to eq('Jessye Ejdelman')
      expect(user.email).to eq('jessye@code.com')
      expect(user.token).to eq('test_token')
    end
  end
end
