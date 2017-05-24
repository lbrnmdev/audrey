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

  private

    def set_insurer
      @insurer = Insurer.find(params[:id])
      check_user_authorization_for @insurer
    end
end
