class AddExpiresAtAndRefreshTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :expires_at, :datetime
    add_column :users, :refresh_token, :string
  end
end
