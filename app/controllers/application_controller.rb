class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ensure user is logged in for all actions
  before_action :authenticate_user!

  private

    # redirect to home if resource doesn't belong to current user
    # def check_user_authorization_for resource
    #   if current_user != resource.user
    #     flash[:error] = "You are not authorized to perform this action!"
    #     redirect_to authenticated_root_url
    #   end
    # end

    # redifine check_user_authorization_for to handle different resource types
    # TODO refactor to use metaprogramming
    # TODO does this present problems when vehicle.client != policy.client ?
    def check_user_authorization_for resource
      if resource.class.to_s == 'Vehicle' || resource.class.to_s == 'Policy'
        compare_current_user_to resource.client.user
      else
        compare_current_user_to resource.user
      end
    end

    def compare_current_user_to user
      if current_user != user
        flash[:error] = "You are not authorized to perform this action!"
        redirect_to authenticated_root_url
      end
    end
end
