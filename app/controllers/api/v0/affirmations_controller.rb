class Api::V0::AffirmationsController < ApplicationController
  def index
    render json: AffirmationService.obtain
  end
end