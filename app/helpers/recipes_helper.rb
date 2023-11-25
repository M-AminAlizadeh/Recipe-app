module RecipesHelper
  def calculate_total_price(recipe)
    recipe.ingredients.map { |ingredient| ingredient.value }.sum
  end
end
