class ShoppingList
  attr_reader :recipe

  def initialize(recipe)
    @recipe = recipe
  end

  def calculate_total_value
    recipe.ingredients.map { |ingredient| ingredient.value }.sum
  end
end
