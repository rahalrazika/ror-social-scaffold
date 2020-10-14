class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id], confirmed: false)
    if @friendship.save
      flash[:notice] = 'You are now friends'
    else
      flash[:alert] = 'Friendship error, please try again'
    end
    redirect_to root_path
  end

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    if @friendship.destroy
      flash[:notice] = 'You are no longer friends'
    else
      flash[:alert] = 'Friendship error, please try again'
    end
    redirect_to root_path
  end

  private

  def friendship_params
    params.require(:frienship).permit(confirmed: true)
  end
end
