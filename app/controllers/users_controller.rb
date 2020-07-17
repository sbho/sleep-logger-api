class UsersController < ApplicationController
  # We do not need to authenticate token for user registration.
  skip_before_action :authenticate_request, only: [:create]

  def create
    @user = User.new(user_params)
    @user.save
    render json: @user, status: :created
  end

  def show
    if @current_user
      render json: @current_user, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end