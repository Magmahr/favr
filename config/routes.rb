Rails.application.routes.draw do
  resources :reviews
  resources :favors
  resources :users

  root "application#index"
  post '/login', to: 'sessions#new'
end
