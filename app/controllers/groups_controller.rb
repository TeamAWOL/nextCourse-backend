class GroupsController < ApplicationController
  before_action only: :show

  def index
      user = User.find(params[:userId])
      payload = {
        groups: user.groups,
      }
      render json: payload, status: 201
  end

  def create
      puts params
      puts params[:mods][:userId]
      puts update_params

      user = User.find(params[:mods][:userId])

      newGroup = Group.new(crate_params)

      user.groups << newGroup

      payload = {
         addGroup: params
      }
      render json: payload, status:201

  end

  def update

      g = Group.find(params[:mods][:group][:id])
      g.update(update_params)

      payload = {
         updateGroup: params
      }
      render json: payload, status:201
  end

  def destroy
      puts(params[:id])
      Group.destroy(params[:id])

      payload = {
         deleteInfo: params[:id]
      }
      render json: payload, status: 201
  end

  private
  def update_params
    params.require(:mods).require(:group).permit(:id,:name,:location,:price_range)
  end

  private
  def create_params
    params.require(:mods).require(:group).require(:name,:location,:price_range)
  end


end
