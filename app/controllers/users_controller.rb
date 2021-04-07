class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :show, :update]
  
  def edit
  end

  def show
    @recipes = @user.recipes
    @tips = @user.tips
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :profile_image,)
  end
  
  def ensure_user
    @user = User.find(params[:id])
  end
  
end
