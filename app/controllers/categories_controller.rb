class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_category, only: [:edit, :show, :update, :destroy]

  
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def show
     @foods = @category.foods
  end

  def update
    @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end
  
  private

  def category_params
    params.require(:category).permit(:category_name)
  end
  
  def ensure_category
    @category = Category.find(params[:id])
  end
  
end
