class UsersController < ApplicationController
  before_action only: :show

  def create
    user = User.new(user_params)

    if user.save
      token = Knock::AuthToken.new(payload: { sub: user.id }).token
      payload = {
        user: user,
        jwt: token
      }
      render json: payload, status: 201
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  private
  def user_params
    params.require(:auth).permit(:first_name,:last_name, :email, :password)
  end
  
end
