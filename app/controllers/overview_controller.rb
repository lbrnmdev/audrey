class OverviewController < ApplicationController
  def home
    @clients = current_user.clients
    @policies = current_user.policies
    @vehicles = current_user.vehicles
  end
end
