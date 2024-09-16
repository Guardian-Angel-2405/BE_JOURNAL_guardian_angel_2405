class Api::V0::GratitudesController < ApplicationController

  def create
    gratitude = Gratitude.create(gratitude_params)
    render json: GratitudeSerializer.new(gratitude), status: 201
  end

  private
  def gratitude_params
    params.require(:gratitude).permit(:user_id, :entry, :date)
  end
end
