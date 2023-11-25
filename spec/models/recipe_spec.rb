require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }

  it 'is valid with valid attributes' do
    recipe = Recipe.new(
      title: 'Delicious Dish',
      description: 'A wonderful recipe',
      preparation_time: 30,
      cooking_time: 45,
      user: user
    )
    expect(recipe).to be_valid
  end

  it 'is not valid without a title' do
    recipe = Recipe.new(
      description: 'A wonderful recipe',
      preparation_time: 30,
      cooking_time: 45,
      user: user
    )
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a description' do
    recipe = Recipe.new(
      title: 'Delicious Dish',
      preparation_time: 30,
      cooking_time: 45,
      user: user
    )
    expect(recipe).to_not be_valid
  end

  it 'is not valid without preparation time' do
    recipe = Recipe.new(
      title: 'Delicious Dish',
      description: 'A wonderful recipe',
      cooking_time: 45,
      user: user
    )
    expect(recipe).to_not be_valid
  end

  it 'is not valid without cooking time' do
    recipe = Recipe.new(
      title: 'Delicious Dish',
      description: 'A wonderful recipe',
      preparation_time: 30,
      user: user
    )
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a negative preparation time' do
    recipe = Recipe.new(
      title: 'Delicious Dish',
      description: 'A wonderful recipe',
      preparation_time: -5,
      cooking_time: 45,
      user: user
    )
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a negative cooking time' do
    recipe = Recipe.new(
      title: 'Delicious Dish',
      description: 'A wonderful recipe',
      preparation_time: 30,
      cooking_time: -10,
      user: user
    )
    expect(recipe).to_not be_valid
  end

  it 'is associated with a user' do
    association = Recipe.reflect_on_association(:user)
    expect(association.macro).to eq :belongs_to
  end

  it 'has many recipe foods' do
    association = Recipe.reflect_on_association(:recipe_foods)
    expect(association.macro).to eq :has_many
  end

  it 'has many foods through recipe foods' do
    association = Recipe.reflect_on_association(:foods)
    expect(association.macro).to eq :has_many
  end

  it 'has many ingredients' do
    association = Recipe.reflect_on_association(:ingredients)
    expect(association.macro).to eq :has_many
  end
end
