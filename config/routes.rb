Rails.application.routes.draw do
  get 'recipes/index'
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get "/recipes", to: "recipes#index", as: :recipes
  resources :recipes, only: [:index, :destroy]

  post 'create_recipe', to: 'home#create_recipe'
end

