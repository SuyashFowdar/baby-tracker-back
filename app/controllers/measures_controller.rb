require 'json'
require 'jwt'

class MeasuresController < ApplicationController
  def create
    payload = JWT.decode(request.headers['token'], secret_key, false)
    @user = User.find(JSON.parse(payload[0])['id'])
    @measure = Measure.new(JSON.parse(request.body.read))
    if @user.name == 'Admin' && @measure.save
      render json: { id: @measure['id'] }, status: :ok
    else
      render json: { error: 'Measurement not created' }, status: :internal_server_error
    end
  end

  private

  def secret_key
    'b@by!'
  end
end
