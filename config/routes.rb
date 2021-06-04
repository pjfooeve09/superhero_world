Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :teams
  resources :superheroes

  resources :users do
    resources :teams, only: [:edit, :update, :destroy]
    resources :superheroes, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  end

  post "/users/:id/teams/:id/edit", to: "teams#edit"

  root "users#new"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  delete "/logout", to: "sessions#destroy"

  get 'auth/:provider/callback', to: 'sessions#facebookAuth'
  get 'auth/failure', to: redirect('/')
end
