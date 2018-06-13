# frozen_string_literal: true

class GunslingersController < ApplicationController
  before_action :set_gunslinger, only: %i[show]

  def index
    @gunslingers = Gunslinger.all
  end

  def show; end

  private

  def set_gunslinger
    @gunslinger = Gunslinger.find(params[:id])
  end
end
