class InsurersController < ApplicationController
  before_action :set_insurer, only: [:show]

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

  private

    def set_insurer
      @insurer = Insurer.find(params[:id])
      check_user_authorization_for @insurer
    end

    def insurer_params
      params.require(:insurer).permit(:name, :full_legal_name, :address, :email_address, :phone_number)
    end
end
