class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    def authenticate
        result =  JsonWebToken.encode(sub: user.id) if get_user
        if result
            render json: { token: result }
        else
            render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
    end

    private

    def get_user
        user = User.find_by_email(params[:email])
        return user if user && user.authenticate(params[:password])
        nil
    end

    def user
        user = User.find_by_email(params[:email])
        return user if user && user.authenticate(params[:password])
        nil
    end
end