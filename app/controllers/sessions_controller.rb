require 'json'
require 'digest'
require 'jwt'

class SessionsController < ApplicationController
  def create
    login_user = sessions_params
    login_user['password'] = Digest::SHA2.new(512).hexdigest(login_user['password'])
    @user = User.where(login_user)
    if @user && @user[0]
      payload = { 'id' => @user[0][:id], 'created_at' => @user[0][:created_at] }
      token = JWT.encode(payload.to_json, secret_key, 'none')
      render json: { token: token, name: @user[0]['name'] }, status: :ok
    else
      render json: { error: 'User not found!' }, status: :unauthorized
    end
  end

  def sessions_params
    params.require(:session).permit(:name, :password)
  end

  private

  def secret_key
    'b@by!'
  end
end
