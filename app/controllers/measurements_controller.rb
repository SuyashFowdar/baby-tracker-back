require 'json'
require 'jwt'

class MeasurementsController < ApplicationController
  def create
    payload = JWT.decode(request.headers['token'], secret_key, false)
    @user = User.find(JSON.parse(payload[0])['id'])
    @measurement = @user.measurements.build(JSON.parse(request.body.read))
    if @measurement.save
      render json: { measurement: @measurement }, status: :ok
    else
      render json: { error: 'Measurement not created' }, status: :internal_server_error
    end
  end

  def fetch
    payload = JWT.decode(request.headers['token'], secret_key, false)
    @user = User.find(JSON.parse(payload[0])['id'])
    @measures = Measure.all
    if @user
      render json: { measurements: @user.measurements, measures: @measures }, status: :ok
    else
      render json: { error: 'Measurement not created' }, status: :internal_server_error
    end
  end

  private

  def secret_key
    'b@by!'
  end
end
