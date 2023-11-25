class AddColumnsToRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    add_reference :recipe_foods, :recipe, null: false, foreign_key: true
    add_reference :recipe_foods, :food, null: false, foreign_key: true
    add_column :recipe_foods, :quantity, :integer
  end
end
