Rails.application.routes.draw do

  root "welcome#start"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :uploads
  resources :categories

  get '/profile', to: 'users#show', as: :profile

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/myprofile', to: 'users#myprofile', as: :myprofile

end
