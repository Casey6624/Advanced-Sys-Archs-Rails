class ApplicationController < ActionController::Base
    # actions available to all controllers
    protect_from_forgery with: :exception
    private
    def current_user
        @current_user ||=User.find(session[:userid]) if session[:userid]
    end
    private
    def find_profile
        @find_profile ||=Profile.find(user_id: session[:userid]) if session[:userid]
    end
    helper_method :current_user
    helper_method :find_profile
    def authorize
        redirect_to new_session_path, alert: "Please login to view this page" if current_user.nil?
    end
end
