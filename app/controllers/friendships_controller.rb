class FriendshipsController < ApplicationController
    def create 
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id], confirmed: true)
    if @friendship.save
        flash[:notice] = "You are now friends"
    else
        flash[:alert] = "Friendship error, please try again"
    end
    redirect_to root_path
    end


    def destroy
        Friendship.find(params[:id]).destroy
        redirect_to root_path 

    end 

    private
    def friendship_params
        params.require(:frienship).permit(:confirmed)

    end
end
