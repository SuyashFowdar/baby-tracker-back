class AdminsController < ApplicationController
  include JWTHelper

  before_action :authenticate_user

  def index
    if @user && @user.name == 'Admin'
      render json: { admin: true }, status: :ok
    else
      render json: { admin: false }, status: :unauthorized
    end
  end
end
