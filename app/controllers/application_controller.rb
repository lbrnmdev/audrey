class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ensure user is logged in for all actions
  before_action :authenticate_user!
end
