class Api::V0::GratitudesController < ApplicationController

  def create
    gratitude = Gratitude.create(gratitude_params)
    render json: GratitudeSerializer.new(gratitude), status: 201
  end

  def index
    gratitudes = Gratitude.all
    user = params[:user_id]
    user_grats = gratitudes.where(user_id: user)
    # binding.pry
    render json: DateSerializer.new(user_grats)
  end

  private
  def gratitude_params
    params.require(:gratitude).permit(:user_id, :entry, :date)
  end
end

# user = Gratitude.find_by(params[:user_id])
# render json GratitudeSerializer.user_dates(user)