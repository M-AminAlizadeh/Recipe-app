class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path, notice: 'Recipe was successfully destroyed.'
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      respond_to do |format|
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_ingredient
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.new
    @foods = Food.all 
  end

  def create_ingredient
    @recipe = Recipe.find(params[:id])
    @ingredient = @recipe.ingredients.build(ingredient_params)

    if @ingredient.save
      redirect_to @recipe, notice: 'Ingredient added successfully.'
    else
      render :add_ingredient
    end
  end

  skip_before_action :authenticate_user!, only: [:public_recipes]
  def public_recipes
     @public_recipes = Recipe.where(public: true).includes(:user, :ingredients => :food)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :preparation_time, :cooking_time, :public)
  end

  def ingredient_params
    params.require(:ingredient).permit(:food_id, :quantity)
  end
end
