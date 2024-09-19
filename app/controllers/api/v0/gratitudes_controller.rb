class Api::V0::GratitudesController < ApplicationController
  def create
    gratitude = Gratitude.new(gratitude_params)
    if gratitude.save
      render json: GratitudeSerializer.new(gratitude), status: 201
    else
      render json: CreationErrorSerializer.error_json, status: 422
    end
  end

  def index # returns all dates for a given user
    user_grats = Gratitude.where(user_id: params[:user_id])
    render json: DateSerializer.new(user_grats)
  end

  def show # returns all entries for a given date and user
    user_grats = Gratitude.where(gratitude_params)
    if user_grats.length == 0
      render json: ErrorSerializer.error_json, status: :not_found
    else
      render json: EntrySerializer.new(user_grats)
    end
  end # did not use begin/rescue because an empty array is truthy
  
  def destroy 
    gratitude = Gratitude.find(params[:id])
    gratitude.destroy
  end

  private
  def gratitude_params
    params.permit(:entry, :date).merge(user_id: params[:user_id])
  end
end