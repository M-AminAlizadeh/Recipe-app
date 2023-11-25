class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.references :recipe, foreign_key: true
      t.references :food, foreign_key: true
      t.integer :quantity
      
      t.timestamps
    end
  end
end
