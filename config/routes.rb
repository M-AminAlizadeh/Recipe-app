Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :recipes, only: [:new, :create, :index, :destroy]
  post 'create_recipe', to: 'home#create_recipe'
  resources :foods, only: [:new, :create, :index, :destroy]
  post 'create_food', to: 'home#create_food'
end

