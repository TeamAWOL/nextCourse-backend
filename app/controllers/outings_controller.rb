class OutingsController < ApplicationController
  before_action only: :show

  def index
      user = User.find(params[:userId])
      payload = {
        outings: user.outings,
      }
      render json: payload, status: 201
  end

  def create
      puts params
      puts params[:mods][:userId]
      puts update_params

      user = User.find(params[:mods][:userId])
      newOuting = Outing.new(update_params)

      user.outings << newOuting

      payload = {
         addOuting: params
      }
      render json: payload, status:201

  end

  def update

      o = Outing.find(params[:mods][:outing][:id])
      o.update(update_params)

      payload = {
         updateOuting: params
      }
      render json: payload, status:201
  end

  def destroy
      puts(params[:id])
      Outing.destroy(params[:id])

      payload = {
         deleteInfo: params[:id]
      }
      render json: payload, status: 201
  end

  private
  def update_params
    params.require(:mods).require(:outing).permit(:id,:winner,:winning_restaurant,:winning_group,:winning_time)
  end


end
