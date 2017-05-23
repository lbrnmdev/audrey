class InsurersController < ApplicationController
  def index
    @insurers = current_user.insurers
  end
end
