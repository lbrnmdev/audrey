class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show, :edit, :update, :destroy]

  def index
    @policies = current_user.policies
  end

  def show
  end

  def new
    @policy = current_user.policies.new
  end

  def create
    @policy = current_user.policies.new(policy_params)
    if @policy.save
      flash[:warning] = "#{@policy.client.other_names_lastname} has a new policy! Please note that the policy is currently: #{@policy.status.humanize}"
      redirect_to @policy
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @policy.update_attributes policy_params
      flash[:success] = "Policy info updated!"
      redirect_to @policy
    else
      render 'edit'
    end
  end

  def destroy
    client = @policy.client
    @policy.destroy
    flash[:success] = "Policy belonging to #{client.other_names_lastname} deleted!"
    redirect_to client
  end

  private

    def set_policy
      @policy = Policy.find(params[:id])
      check_user_authorization_for @policy
    end

    def policy_params
      params.require(:policy).permit(:number, :policy_type, :status, :issue_date, :start_date, :end_date, :premium, :commission, :discount, :client_id, :vehicle_id)
    end
end
