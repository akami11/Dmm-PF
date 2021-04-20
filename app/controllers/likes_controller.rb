class LikesController < ApplicationController
  
  def create
    @tip = Tip.find(params[:tip_id])
    like = @tip.likes.new(user_id: current_user.id)
    like.save
  end
  def destroy
    @tip = Tip.find(params[:tip_id])
    like = @tip.likes.find_by(user_id: current_user.id)
    like.destroy
  end
end
