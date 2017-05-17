class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show]

  def index
    @policies = current_user.policies
  end

  def show
  end

  def new
    @policy = current_user.policies.new
  end

  private

    def set_policy
      @policy = Policy.find(params[:id])
      check_user_authorization_for @policy
    end
end
