class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def new
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredient = @recipe.ingredients.build
    # if @recipe.user_id = current_user.id
    #   render :edit
    # else
    #   redirect_to recipe_path(params[:id])
    # end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :recipe_image, :process,
                                ingredients_attributes: [:id, :recipe_id,:ingredient_name, :quantity, :_destroy])
  end

end
