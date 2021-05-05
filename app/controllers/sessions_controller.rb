require 'digest'

class SessionsController < ApplicationController
  include JWTHelper

  def create
    login_user = sessions_params
    login_user['password'] = Digest::SHA2.new(512).hexdigest(login_user['password'])
    @user = User.where(login_user)[0]
    if @user
      render json: { token: encode_token, name: @user['name'] }, status: :ok
    else
      render json: { error: 'Username or password is incorrect!' }, status: :unauthorized
    end
  end

  def sessions_params
    params.require(:session).permit(:name, :password)
  end
end
