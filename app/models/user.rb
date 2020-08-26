class User < ApplicationRecord
  validates_presence_of :uid, :name, :email, :token

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties
  has_many :invitations

  def self.from_omniauth(response)
    user = User.find_or_create_by(uid: response[:uid])
    user.name = response[:info][:name]
    user.email = response[:info][:email]
    user.uid = response[:uid]
    user.token = response[:credentials][:token]
    user.expires_at = response[:credentials][:expires_at]
    user.refresh_token = response[:credentials][:refresh_token]
    user.save
    user
  end
end
