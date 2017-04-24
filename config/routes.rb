Rails.application.routes.draw do

  root "welcome#start"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

end
