class ApplicationController < ActionController::Base
  #Overrides CSRF protection
  skip_before_action :verify_authenticity_token
  #For all controller inheriting from ApplicationController, authenticate token before any method invocation.
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = user
    render json: {error: 'Not Authorized'}, status: 401 unless @current_user
  end

  # Returns the user with the id the payload carries, if exists.
  def user
    @user ||= User.find(decoded_auth_token[:sub]) if decoded_auth_token
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    @headers = request.headers
    if @headers['Authorization'].present?
      return @headers['Authorization'].split(' ').last
    else
      return "Header not present"
    end
    nil
  end
end
