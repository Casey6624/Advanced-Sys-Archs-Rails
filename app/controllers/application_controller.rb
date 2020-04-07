class ApplicationController < ActionController::Base
    # actions available to all controllers
    protect_from_forgery with: :exception
    private
    def current_user
        @current_user ||=User.find(session[:user_name]) if session[:user_name]
    end
    helper_method :current_user
    def authorize
        redirect_to new_session_path, alert: "Please login to view this page" if current_user.nil?
    end
end
