# frozen_string_literal: true

class BadgeIssuancesController < ApplicationController
  def create
    @gunslinger = Gunslinger.find(gunslinger_id)
    if BadgeIssuanceService.new(id: @gunslinger.id, badge_template_id: badge_params[:template_id]).call
      redirect_to gunslinger_path(gunslinger_id)
    else
      redirect_to gunslingers_path
    end
  end

  private

  def gunslinger_id
    badge_params[:gunslinger_id]
  end

  def badge_params
    params.permit(:gunslinger_id, :template_id)
  end
end
