class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def create
    @food = Food.new(food_params)
    @food.save
    redirect_to foods_path
  end

  def new
    @food = Food.new
    @categories = Category.all
  end

  def edit
    @food = Food.find(params[:id])
    @categories = Category.all
  end

  def show
     @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to foods_path
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end
  
  private
  
  def food_params
    params.require(:food).permit(:food_name, :food_image, :calorie, :protein, :fat, :carbohydrate, :salt_equivalent, :other_nutrition, :category_id)
  end
end
