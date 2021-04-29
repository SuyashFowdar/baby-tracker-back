require 'json'
require 'digest'
require 'jwt'

class UsersController < ApplicationController
  def create
    new_user = users_params
    new_user['password'] = Digest::SHA2.new(512).hexdigest(new_user['password'])
    @user = User.new(new_user)
    if @user.save
      payload = { 'id' => @user[:id], 'created_at' => @user[:created_at] }
      token = JWT.encode(payload.to_json, secret_key, 'none')
      render json: { token: token }, status: :ok
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

  private

  def secret_key
    'b@by!'
  end
end
