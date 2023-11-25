class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @new_recipe = Recipe.new
    @food = Food.new
    @foods = Food.all
  end

  def create_recipe
    @new_recipe = Recipe.new(recipe_params)
    @new_recipe.user = current_user
    if @new_recipe.save
      redirect_to authenticated_root_path, notice: 'Recipe was successfully created.'
    else
      render :index
    end
  end

  def create_food
    @food = Food.new(food_params)

    if @food.save
      redirect_to authenticated_root_path, notice: 'Food was successfully created.'
    else
      render :index
    end
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :preparation_time, :cooking_time, :public)
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :unit_price)
  end
end
