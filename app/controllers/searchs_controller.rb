class SearchsController < ApplicationController
  
  def search
    @model = params["model"]
    @content = params["content"]
    @records = search_for(@model,@content)
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
