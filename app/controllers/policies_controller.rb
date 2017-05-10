class PoliciesController < ApplicationController
  def index
    @policies = @current_user.policies
  end
end
