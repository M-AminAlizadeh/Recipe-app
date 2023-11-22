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

  get "users/shopping_list"

  resources :foods, only: [:new, :create, :destroy]

  post 'create_recipe', to: 'home#create_recipe'
end

