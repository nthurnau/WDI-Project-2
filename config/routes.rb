Rails.application.routes.draw do

  get '/' => 'welcome#index'

  resources :users

  delete 'user/:id' => 'users#destroy', as: :destroy_user


  resources :profiles


  get '/logout' => 'sessions#destroy', as: :logout

  resources :sessions, only: [:new, :create]



end
