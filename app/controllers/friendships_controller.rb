class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    Friendship.create_reciprocal_for_ids(current_user.id, friend.id)
    redirect_to "/dashboard"
  end
end
