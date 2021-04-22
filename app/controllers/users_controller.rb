require 'json'
require 'digest'
require 'jwt'

class UsersController < ApplicationController
  def create
    new_user = JSON.parse(request.body.read)
    new_user['password'] = Digest::SHA2.new(512).hexdigest(new_user['password'])
    @user = User.new(new_user)
    if @user.save
      payload = { 'id' => @user[:id], 'created_at' => @user[:created_at] }
      token = JWT.encode(payload.to_json, secret_key, 'none')
      render json: { token: token }, status: :ok
    else
      render json: { error: @user.errors }, status: :internal_server_error
    end
  end

  def login
    login_user = JSON.parse(request.body.read)
    login_user['password'] = Digest::SHA2.new(512).hexdigest(login_user['password'])
    @user = User.where(login_user)
    if @user && @user[0]
      payload = { 'id' => @user[0][:id], 'created_at' => @user[0][:created_at] }
      token = JWT.encode(payload.to_json, secret_key, 'none')
      render json: { token: token, name: @user[0]['name'] }, status: :ok
    else
      render json: { error: 'User not found!' }, status: :internal_server_error
    end
  end

  def admin
    payload = JWT.decode(request.headers['token'], secret_key, false)
    @user = User.find(JSON.parse(payload[0])['id'])
    if @user && @user.name == 'Admin'
      render json: { admin: true }, status: :ok
    else
      render json: { admin: false }, status: :internal_server_error
    end
  end

  private

  def secret_key
    'b@by!'
  end
end
