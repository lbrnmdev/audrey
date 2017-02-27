class VehiclesController < ApplicationController
  def index
    # should this be vehicles specific to current user or the whole system?
    # something like current_user.vehicles or current_user.clients.vehicles
    @vehicles = current_user.vehicles
  end
end
