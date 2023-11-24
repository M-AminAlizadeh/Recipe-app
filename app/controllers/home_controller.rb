class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @new_recipe = Recipe.new
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

  def recipe_params
    params.require(:recipe).permit(:title, :description, :preparation_time, :cooking_time, :public)
  end
end
