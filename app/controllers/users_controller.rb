class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update!(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy!
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:role)
  end

end
