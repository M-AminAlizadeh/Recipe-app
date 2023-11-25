class IngredientsController < ApplicationController
  before_action :set_recipe

  def new
    @ingredient = Ingredient.new
    @foods = Food.all
  end

  def create
    @ingredient = @recipe.ingredients.build(ingredient_params)
    if @ingredient.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient added successfully.'
    else
      render :new
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:food_id, :quantity)
  end
end
