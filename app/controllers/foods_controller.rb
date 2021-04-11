class FoodsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :ensure_food, only: [:edit, :show, :update, :destroy]


  def index
    @foods = Food.all
    @categories = Category.all

    # ランダムなTipを取得
    @tip = Tip.find(Tip.pluck(:id).sample)

  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to foods_path
    else
      @categories = Category.all
      render :new
    end
  end

  def new
    @food = Food.new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
  end

  def show
    @tip = Tip.find(Tip.pluck(:id).sample)

    # 食材の名前と同じ名前の材料を呼び出しています。viewの方でその食材を使った料理を呼び出しています。
    @ingredients = Ingredient.where(ingredient_name: @food.food_name)


  end

  def update
    if @food.update(food_params)
      redirect_to foods_path
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :food_image, :calorie, :protein, :fat, :carbohydrate, :salt_equivalent, :other_nutrition, :category_id)
  end

  def ensure_food
    @food = Food.find(params[:id])
  end
end
