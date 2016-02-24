Rails.application.routes.draw do


  root                'static_pages#home'
    get    'help'    => 'static_pages#help'
    get    'about'   => 'static_pages#about'
    get    'contact' => 'static_pages#contact'

  resources :users do
    member do
      get :following, :followers
    end
  end


  delete 'user/:id' => 'users#destroy', as: :destroy_user


  resources :profiles


  get '/logout' => 'sessions#destroy', as: :logout

  resources :sessions, only: [:new, :create]

  # resources :microposts,          only: [:create, :destroy]
  #microposts POST   /microposts(.:format)          microposts#create
  #micropost DELETE /microposts/:id(.:format)      microposts#destroy
  resources :relationships,       only: [:create, :destroy]
  #relationships POST   /relationships(.:format)       relationships#create
  #relationship DELETE /relationships/:id(.:format)   relationships#destroy

end
