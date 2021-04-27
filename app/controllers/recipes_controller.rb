class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :ensure_recipe, only: [:edit, :show, :update, :destroy]
  
  def index
    @recipes = Recipe.page(params[:page]).per(5)
    @tip = Tip.find(Tip.pluck(:id).sample)
    @categories =Category.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def new
    @recipe = Recipe.new
    
    # cocconで使う、親モデルに子モデルのインスタンスを作成
    @ingredient = @recipe.ingredients.build
  
  end

  def edit
    @ingredient = @recipe.ingredients.build
    if @recipe.user = current_user
      render :edit
    else
      redirect_to recipe_path(params[:id])
    end
  end

  def show
    @ingredients = @recipe.ingredients
    @tip = Tip.find(Tip.pluck(:id).sample) 
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :recipe_image, :process, :phrase, :about_time,
                                ingredients_attributes: [:id, :recipe_id,:ingredient_name, :quantity, :_destroy]) #これでレシピと一緒にデータを保存出来てる
  end

  def ensure_recipe
    @recipe = Recipe.find(params[:id]) 
  end
  
end
