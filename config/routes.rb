Rails.application.routes.draw do

  root 'wecome#index'

  resources :users

  delete 'user/:id' => 'users#destroy', as: :destroy_user

  get '/logout' => 'sessions#destroy', as: :logout

  resources :sessions, only: [:new, :create]

  resources :profiles


end
