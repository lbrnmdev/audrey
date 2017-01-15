class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ensure user is logged in for all actions
  before_action :authenticate_user!

  private

    # redirect to home if resource doesn't belong to current user
    def check_user_authorization_for resource
      if current_user != resource.user
        flash[:error] = "You are not authorized to perform this action!"
        redirect_to authenticated_root_url
      end
    end
end
