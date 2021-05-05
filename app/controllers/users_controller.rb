require 'digest'

class UsersController < ApplicationController
  include JWTHelper

  def create
    new_user = users_params
    new_user['password'] = Digest::SHA2.new(512).hexdigest(new_user['password'])
    @user = User.new(new_user)
    if @user.save
      render json: { token: encode_token }, status: :ok
    else
      error = if @user.errors.messages && @user.errors.messages[:name]
                "Name #{@user.errors.messages[:name][0]}"
              else
                "Couldn't Sign Up"
              end
      render json: { error: error }, status: :unauthorized
    end
  end

  def users_params
    params.require(:user).permit(:name, :password)
  end
end
