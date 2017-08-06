class OverviewController < ApplicationController
  def home
    @clients = current_user.clients
  end
end
