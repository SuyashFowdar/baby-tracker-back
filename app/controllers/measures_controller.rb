class MeasuresController < ApplicationController
  include JWTHelper

  before_action :authenticate_user

  def create
    @measure = Measure.new(measures_params)
    if @user.name == 'Admin' && @measure.save
      render json: { id: @measure['id'] }, status: :ok
    else
      render json: { error: 'Measurement not created' }, status: :internal_server_error
    end
  end

  def measures_params
    params.require(:measure).permit(:item, :unit)
  end
end
