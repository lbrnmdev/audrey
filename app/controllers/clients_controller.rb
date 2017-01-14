class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :check_user_authorization, only: [:show, :edit, :update, :destroy]

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

  def destroy
    lastname = @client.lastname
    other_names = @client.other_names.blank? ? '' : "#{@client.other_names} "
    @client.destroy
    flash[:success] = "Client, #{other_names + lastname}, successfully removed!"
    redirect_to clients_url
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:lastname, :other_names, :telephone, :email, :address)
    end

    # TODO move this to application controller, should ensure current_user owns resource
    def check_user_authorization
      if current_user != @client.user
        flash[:error] = "You are not authorized to work with this client!"
        redirect_to authenticated_root_url
      end
    end

end
