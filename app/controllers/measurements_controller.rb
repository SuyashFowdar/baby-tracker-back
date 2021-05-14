class MeasurementsController < ApplicationController
  include JWTHelper

  before_action :authenticate_user

  def create
    @measurement = @user.measurements.build(measurements_params)
    if @measurement.save
      render json: { measurement: @measurement }, status: :ok
    else
      render json: { error: 'Measurement not created!' }, status: :unprocessable_entity
    end
  end

  def index
    @measures = Measure.all
    if @user
      render json: { measurements: @user.measurements, measures: @measures }, status: :ok
    else
      render json: { error: 'Measurements not fetched!' }, status: :not_found
    end
  end

  def measurements_params
    params.require(:measurement).permit(:amount, :measure_id)
  end
end
