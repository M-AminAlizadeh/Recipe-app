module RecipesHelper
  def calculate_total_price(recipe)
    recipe.ingredients.map { |ingredient| ingredient.value }.sum
  end

  def calculate_total_value(recipe)
    total_value = recipe.ingredients.sum { |ingredient| ingredient.food.price * ingredient.quantity }
    number_to_currency(total_value, precision: 2)
  end
end
