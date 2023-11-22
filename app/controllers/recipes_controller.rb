class RecipesController < ApplicationController
  before_action :set_recipe, only: [:destroy]

  def index
    @recipes = Recipe.all
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe was successfully removed."
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
