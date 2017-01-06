class ClientsController < ApplicationController
  before_action :set_client, only: [:show]

  def index
    @clients = current_user.clients
  end

  def show
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end
end
