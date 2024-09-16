class Api::V0::GratitudesController < ApplicationController

  def create
    gratitude = Gratitude.create(gratitude_params)
    render json: GratitudeSerializer.new(gratitude), status: 201
  end

  def index # returns all dates for a given user
    gratitudes = Gratitude.all
    user = params[:user_id]
    user_grats = gratitudes.where(user_id: user)
    render json: DateSerializer.new(user_grats)
  end

  def show # returns all entries for a given date and user
    gratitudes = Gratitude.all
    user = params[:user_id]
    entry_date = params[:date]
    user_grats = gratitudes.where(user_id: user, date: entry_date)
    render json: EntrySerializer.new(user_grats)
  end
  
  def destroy 
    gratitude = Gratitude.find(params[:id])
    gratitude.destroy
  end

  private
  def gratitude_params
    params.require(:gratitude).permit(:user_id, :entry, :date)
  end
end