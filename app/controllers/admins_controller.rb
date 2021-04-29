require 'json'
require 'jwt'

class AdminsController < ApplicationController
  def index
    payload = JWT.decode(request.headers['token'], secret_key, false)
    @user = User.find(JSON.parse(payload[0])['id'])
    if @user && @user.name == 'Admin'
      render json: { admin: true }, status: :ok
    else
      render json: { admin: false }, status: :forbidden
    end
  end

  private

  def secret_key
    'b@by!'
  end
end
