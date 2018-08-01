Rails.application.routes.draw do
  resources :reviews
  resources :favors
  resources :users
  # resources :user_favors

  root "application#index"
  # get '/profile', to: 'user#show', as: 'profile'
  get '/login', to: 'sessions#new'
  post "/login", to: 'sessions#create'
  post "/logout", to: "sessions#destroy"
  post '/make_user_favor', to: "user_favors#create"
end
