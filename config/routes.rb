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

  resources :recipes do
    member do
      get 'add_ingredient', to: 'recipes#add_ingredient'
      post 'create_ingredient', to: 'recipes#create_ingredient'
      get 'generate_shopping_list', to: 'recipes#generate_shopping_list'
    end
    resources :ingredients
  end
  
  resources :foods, only: [:new, :create, :index, :destroy]

  post 'create_recipe', to: 'home#create_recipe'
  post 'create_food', to: 'home#create_food'
end
