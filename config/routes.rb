Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root "home#index"

  delete "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#create"

  resources :users

  namespace :admin do
    root "dashboard#index"
    resources :categories, except: :show
    resources :users, except: [:edit, :show]
    resources :tags
  end

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
