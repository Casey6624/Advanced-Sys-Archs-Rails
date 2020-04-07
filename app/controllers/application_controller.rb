class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    private
    def current_user
        @current_user ||=User.find(session[:user_name]) if session[:user_name]
        logger.info "user is #{@current_user}" 
    end
    helper_method :current_user
end
