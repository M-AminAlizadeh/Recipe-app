Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # root "recipes#public_recipes"
  get "users/shopping_list"

  resources :foods, only: [:index, :new, :create, :destroy]