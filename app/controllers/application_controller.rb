class ApplicationController < ActionController::Base
    #Overrides CSRF protection
    skip_before_action :verify_authenticity_token
    #For all controller inheriting from ApplicationController, authenticate token before any method invocation.
    before_action :authenticate_request
    attr_reader :current_user

    private

    def authenticate_request
        @current_user = get_user(request.headers)
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end

    # Returns the user with the id the payload carries, if exists.
    def get_user
        @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
        @user || errors.add(:token, 'Invalid token') && nil
    end

    def decoded_auth_token
        @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
        if headers['Authorization'].present?
            return headers['Authorization'].split(' ').last
        else
            errors.add(:token, 'Missing token')
        end
        nil
    end
end
