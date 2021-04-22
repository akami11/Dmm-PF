class TipsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_tip, only: [:edit, :update, :destroy]
  
  def create
    @tip = Tip.new(tip_params)
    @tip.user_id = current_user.id
    if @tip.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def new
    @tip = Tip.new
  end

  def edit
  end

  def update
    if @tip.update(tip_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @tip.destroy
    redirect_to user_path(current_user.id)
  end
  
  private
  
  def tip_params
    params.require(:tip).permit(:tip_contents)
  end
  
  def ensure_tip
    @tip = Tip.find(params[:id])
  end
  
end
