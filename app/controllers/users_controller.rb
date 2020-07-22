class UsersController < ApplicationController
  # We do not need to authenticate token for user registration.
  skip_before_action :authenticate_request, only: [:create]

  def create
    if User.find(user_params[:email])
      render json: {error: 'An user with this email already exists.'}, status: :created
    else
      @user = User.new(user_params)
      @user.save
      render json: @user, status: :created
    end
  end

  def update
    if @current_user.update(user_params)
      render json: @current_user, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def profile
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