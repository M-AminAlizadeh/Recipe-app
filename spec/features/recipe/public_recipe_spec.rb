# spec/features/recipe/public_recipe_spec.rb

require 'rails_helper'

RSpec.describe 'Public Recipes Page', type: :feature do
  before do
    # Create a user
    @user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')

    # Create some public recipes
    @public_recipes = [
      Recipe.create(user: @user, title: 'Recipe 1', public: true),
      Recipe.create(user: @user, title: 'Recipe 2', public: true),
      Recipe.create(user: @user, title: 'Recipe 3', public: true)
    ]
  end

  it 'displays public recipes' do
    visit public_recipes_path

    @public_recipes.each do |recipe|
      expect(page).to have_content("Public Recipes")
    end
  end
end
