class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    private
    def current_user
        @current_user ||=User.find(session[:username]) if session[:username]
    end
    helper_method :current_user
end
