Rails.application.routes.draw do

  root "welcome#start"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :uploads
  resources :categories

  get '/account', to: 'users#show', as: :account

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#profile', as: :profile

end
