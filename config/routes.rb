Rails.application.routes.draw do
  root "home#index"

  resources :users
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    root "dashboard#index"
    resources :categories, except: :show
    resources :users, only: [:update, :create, :index]
  end
end
