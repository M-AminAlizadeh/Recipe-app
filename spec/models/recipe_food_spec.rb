require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }
  let(:recipe) do
    Recipe.create(title: 'Delicious Dish', description: 'A wonderful recipe', preparation_time: 30, cooking_time: 45,
                  user:)
  end
  let(:food) { Food.create(name: 'Tomato', measurement_unit: 'kg', quantity: 2, user:) }

  it 'is associated with a recipe' do
    association = RecipeFood.reflect_on_association(:recipe)
    expect(association.macro).to eq :belongs_to
  end

  it 'is associated with a food' do
    association = RecipeFood.reflect_on_association(:food)
    expect(association.macro).to eq :belongs_to
  end
end
