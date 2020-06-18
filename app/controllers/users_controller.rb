class UsersController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    @user = User.new(user_params)
    @user.save
    render json: @user, status: :created
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
