class User < ApplicationRecord
  
  def self.from_omniauth(response)
    user = User.find_or_create_by(uid: response[:uid])
    user.email = response[:info][:email]
    user.uid = response[:uid]
    user.token = response[:credentials][:token]
    user.save
  end
end
