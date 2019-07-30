Rails.application.routes.draw do
  root "home#index"

  delete "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#create"

  resources :users

  namespace :admin do
    root "dashboard#index"
    resources :categories, except: :show
    resources :users, only: [:update, :create, :index]
  end

  resources :account_activations, only: [:edit]
end
