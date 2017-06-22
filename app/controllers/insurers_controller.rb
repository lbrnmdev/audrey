class InsurersController < ApplicationController
  before_action :set_insurer, only: [:show, :edit, :update, :destroy]

  def index
    @insurers = current_user.insurers
  end

  def show
  end

  def new
    @insurer = current_user.insurers.new
  end

  def create
    @insurer = current_user.insurers.new(insurer_params)
    if @insurer.save
      flash[:success] = "#{@insurer.full_legal_name} has been added as an insurance company"
      redirect_to @insurer
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @insurer.update_attributes insurer_params
      flash[:success] = "Insurer info updated!"
      redirect_to @insurer
    else
      render 'edit'
    end
  end

  def destroy
    insurer_name = @insurer.full_legal_name
    @insurer.destroy
    flash[:success] = "#{insurer_name} has been deleted"
    redirect_to insurers_path
  end

  private

    def set_insurer
      @insurer = Insurer.find(params[:id])
      check_user_authorization_for @insurer
    end

    def insurer_params
      params.require(:insurer).permit(:name, :full_legal_name, :address, :email_address, :phone_number, :website)
    end
end
