class OverviewController < ApplicationController
  def home
    @clients = current_user.clients
    @policies = current_user.policies
  end
end
