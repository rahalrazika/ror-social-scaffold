class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id], confirmed: false)
    if @friendship.save
      flash[:notice] = 'Friendship request sent'
    else
      flash[:alert] = 'Friendship error, please try again'
    end
    redirect_to root_path
  end

  def update
    @friendship = Friendship.where(friend_id: current_user.id, user_id: params[:id]).first
    if @friendship.update(confirmed: true)
      flash[:notice] = 'Friendship accepted'
    else
      flash[:alert] = 'Friendship error, please try again'
    end
    redirect_to root_path
  end

  def destroy
    unless Friendship.where(friend_id: params[:id]).first.nil?
      @friendship = Friendship.where(friend_id: params[:id]).first
    end
    @friendship = Friendship.where(user_id: params[:id]).first unless Friendship.where(user_id: params[:id]).first.nil?
    if @friendship.destroy
      flash[:notice] = 'You are no longer friends'
    else
      flash[:alert] = 'Friendship error, please try again'
    end
    redirect_to root_path
  end
end
