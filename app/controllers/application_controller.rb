class ApplicationController < ActionController::Base
    # actions available to all controllers
    protect_from_forgery with: :exception
    private
    def current_user
        @current_user ||=User.find(session[:userid]) if session[:userid]
    end
    def authorize_profile
        redirect_to new_profile_path, alert: "Please create a profile to view this page" if Profile.find_by_user_id(session[:userid]).blank?
    end
    helper_method :current_user
    def authorize
        redirect_to new_session_path, alert: "Please login to view this page" if current_user.nil?
    end
end
