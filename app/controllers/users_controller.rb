class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def search 
    @users = User.all
  end

  private 

  def user_params
    params.require(:user).permit(:user_name, :display_name, :introduction, :user_image)
  end

end
