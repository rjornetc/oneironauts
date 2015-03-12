class FriendshipsController < ApplicationController

    def create
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
      authorize @friendship
      if @friendship.save
        flash[:notice] = "Added friend."
        redirect_to user_profile_path(@friendship.friend)
      else
        flash[:notice] = "Unable to add friend."
        redirect_to user_profile_path(@friendship.friend)
      end
    end

    def destroy  
      @friendship = current_user.friendships.find_by_friend_id(params[:friend_id])
      authorize @friendship
      @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to user_profile_path(@friendship.friend)
    end

end
