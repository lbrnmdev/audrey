class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update]

  def index
    @clients = current_user.clients
  end

  def show
  end

  def new
    @client = current_user.clients.new
  end

  def create
    @client = current_user.clients.new(client_params)
    if @client.save
      flash[:success] = "New client, #{@client.lastname} added!"
      redirect_to @client
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @client.update_attributes client_params
      flash[:success] = "Client info updated!"
      redirect_to @client
    else
      render 'edit'
    end
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:lastname, :other_names, :telephone, :email, :address)
    end
end
