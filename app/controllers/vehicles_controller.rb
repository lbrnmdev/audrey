class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

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

  def create
    @vehicle = current_user.vehicles.new(vehicle_params)
    if @vehicle.save
      flash[:success] = "#{@vehicle.client.other_names_lastname} has a new vehicle!"
      redirect_to @vehicle
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @vehicle.update_attributes vehicle_params
      flash[:success] = "Vehicle info updated!"
      redirect_to @vehicle
    else
      render 'edit'
    end
  end

  def destroy
    client = @vehicle.client
    vehicle_name = "#{@vehicle.year_of_manufacture} #{@vehicle.make} #{@vehicle.model}"
    @vehicle.destroy
    flash[:success] = "#{client.other_names_lastname}'s #{vehicle_name} deleted!"
    redirect_to client
  end

  private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
      check_user_authorization_for @vehicle
    end

    def vehicle_params
      params.require(:vehicle).permit(:make, :model, :year_of_manufacture, :body_type, :seating_capacity, :cubic_capacity, :registration_no, :chassis_no, :client_id)
    end
end
