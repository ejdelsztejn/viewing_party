class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend
      Friendship.create_reciprocal_for_ids(current_user.id, friend.id)
      redirect_to "/dashboard"
    else
      flash[:errors] = "Friend does not exist in system. Cannot add."
      redirect_to "/dashboard"
    end
  end
end
