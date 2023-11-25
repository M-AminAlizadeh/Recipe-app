Rails.application.routes.draw do
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
  get '/public_recipes', to: 'recipes#public_recipes'

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :recipes, only: [:new, :create, :index, :destroy, :show, :update] do
    member do
      get 'add_ingredient', to: 'recipes#add_ingredient'
      post 'create_ingredient', to: 'recipes#create_ingredient'
    end
    resources :ingredients, only: [:edit, :destroy]
  end

  resources :foods, only: [:new, :create, :index, :destroy]

  post 'create_recipe', to: 'home#create_recipe'
  post 'create_food', to: 'home#create_food'
end
