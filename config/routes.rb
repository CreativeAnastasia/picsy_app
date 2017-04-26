Rails.application.routes.draw do

  root "welcome#start"

  get '/profile', to: 'users#show', as: :profile
  get '/edit', to: 'users#edit', as: :edit
  get '/update', to: 'users#update', as: :update
  get '/uploads/all', to: 'uploads#all', as: :all

  resources :users, only: [:new, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :uploads
  resources :categories


  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'



end
