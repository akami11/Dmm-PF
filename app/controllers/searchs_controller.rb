class SearchsController < ApplicationController
  before_action :authenticate_user!, except: [:search]
  
  def search
    @model = params["model"]
    @content = params["content"]
    @records = search_for(@model,@content).page(params[:page]).per(12)
    @categories = Category.all
    @tip = Tip.find(Tip.pluck(:id).sample)
  end

  private

  def search_for(model, content)
    if model == "food"
      Food.where("food_name LIKE ?", "%"+content+"%")
    else
      Recipe.where("recipe_name LIKE ?", "%"+content+"%" )
    end
  end

end
