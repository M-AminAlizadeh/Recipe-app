class ShoppingList
  attr_reader :recipe

  def initialize(recipe)
    @recipe = recipe
  end

  def calculate_total_value
    recipe.ingredients.map(&:value).sum
  end
end
