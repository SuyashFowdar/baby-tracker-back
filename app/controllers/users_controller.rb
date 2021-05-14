require 'digest'

class UsersController < ApplicationController
  include JWTHelper

  def create
    new_user = users_params
    @user = User.create(name: new_user[:name], password: new_user[:password])
    if @user.save
      render json: { token: encode_token }, status: :ok
    else
      render json: { error: "Couldn't Sign Up", details: @user.errors }, status: :unprocessable_entity
    end
  end

  def users_params
    params.permit(:name, :password)
  end
end
