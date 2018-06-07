class FriendsController < ApplicationController
  before_action only: :show

  def index
      group = Group.find(params[:groupId])
      payload = {
        friends: group.friends
      }
      render json: payload, status: 201
  end

  def create

      group = Group.find(params[:mods][:groupId])

      params[:mods][:friend].each { |friend|
       f =  friend[1]
       newFriend = Friend.new(update_set_params(f))
       group.friends << newFriend
      }

      payload = {
         addFriend: params
      }
      render json: payload, status:201

  end

  def update

      f = Friend.find(params[:mods][:friend][:id])
      f.update(update_params)

      payload = {
         updateFriend: params
      }
      render json: payload, status:201
  end

  def destroy

      Friend.destroy(params[:id])

      payload = {
         deleteInfo: params[:id]
      }
      render json: payload, status: 201
  end

  private
  def update_params
    params.require(:mods).require(:friend).permit(:id,:name,:email,:preference)
  end

  private
  def update_set_params (friend)
    puts 'inside of update!!'
    puts friend
    friend.permit(:id,:name,:email,:preference)
  end

end
