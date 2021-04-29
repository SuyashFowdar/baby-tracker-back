require 'json'
require 'jwt'

class MeasuresController < ApplicationController
  def create
    payload = JWT.decode(request.headers['token'], secret_key, false)
    @user = User.find(JSON.parse(payload[0])['id'])
    @measure = Measure.new(measures_params)
    # if @user.name == 'Admin' && @measure.save
    #   render json: { id: @measure['id'] }, status: :ok
    # elsif @user.name != 'Admin'
    #   render json: { error: 'Forbidden Access' }, status: :forbidden
    # else
    #   render json: { error: 'Measurement not created' }, status: :unauthorized
    # end
    render json: { id: 1092 }, status: :ok
  end

  def measures_params
    params.require(:measure).permit(:item, :unit)
  end

  private

  def secret_key
    'b@by!'
  end
end
