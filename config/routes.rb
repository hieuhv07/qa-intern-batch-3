Rails.application.routes.draw do
  root "home#index"

  get "/signup", to: "users#new"
  delete "/logout", to: "sessions#destroy"

  resources :users
  delete "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#create"

  namespace :admin do
    root "dashboard#index"
    resources :categories, except: :show
    resources :users, only: [:update, :create, :index]
  end
end
