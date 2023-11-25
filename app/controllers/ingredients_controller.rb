class IngredientsController < ApplicationController
  before_action :set_recipe
  before_action :set_ingredient, only: [:destroy]

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

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to @recipe, notice: 'Ingredient was successfully removed.' }
      format.js
    end
  end

  def edit
    @ingredient = @recipe.ingredients.find(params[:id])
    @foods = Food.all
  end

  def update
    @ingredient = @recipe.ingredients.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to @recipe, notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_ingredient
    @ingredient = @recipe.ingredients.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:food_id, :quantity)
  end
end
