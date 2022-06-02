class Api::V1::TeasController < ApplicationController
  def create
    tea = Tea.new(tea_params)
    if tea.save
      render json: TeaSerializer.new(tea)
    else
      render json: { error: "unable to create tea" }, status: :bad_request
    end
  end

  private
  def tea_params
    params.permit(:title, :description, :temperature, :brew_time)
  end
end
