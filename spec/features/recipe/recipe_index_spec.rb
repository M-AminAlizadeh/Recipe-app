require 'rails_helper'

RSpec.describe 'Recipe Index Page', type: :feature do
  before do
    @user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    @recipe = Recipe.create(
      user: @user,
      title: 'Sample Recipe',
      description: 'This is a sample recipe description.'
    )
  end

  it 'logs in a user' do
    visit new_user_session_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in', id: 'log-in'

    expect(page).to have_content('Welcome, John Doe!')
  end

  it 'displays a list of recipes' do
    # Visit the recipes index page
    visit recipes_path

    # Add expectations based on your view content
    expect(page).to have_content('Recipes List')
    expect(page).to have_selector('.flex-item', count: Recipe.count)
  end

  it 'shows recipe details and action buttons' do
    # Visit the recipes index page
    visit recipes_path

    # Add expectations based on your view content and the sample recipe
    expect(page).to have_content(@recipe.title)
    expect(page).to have_content(@recipe.description)
    expect(page).to have_link('More info', href: recipe_path(@recipe))
    expect(page).to have_button('Remove')
  end

  it 'handles the case when there are no recipes' do
    # Ensure there are no recipes
    Recipe.destroy_all

    # Visit the recipes index page
    visit recipes_path

    # Add expectations for the case when there are no recipes
    expect(page).to have_content('No Recipes available.')
  end
end
