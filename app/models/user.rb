class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def self.from_omniauth(response)
    user = User.find_or_create_by(uid: response[:uid])
    user.name = response[:info][:name]
    user.email = response[:info][:email]
    user.uid = response[:uid]
    user.token = response[:credentials][:token]
    user.save
    user
  end
end

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
end
