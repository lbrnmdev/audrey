class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show]

  def index
    # should this be vehicles specific to current user or the whole system?
    # something like current_user.vehicles or current_user.clients.vehicles
    @vehicles = current_user.vehicles
  end

  def show
  end

  def new
    @vehicle = current_user.vehicles.new
  end

  private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
      check_user_authorization_for @vehicle
    end
end
