Rails.application.routes.draw do

    root                'sessions#new'
    get    'help'    => 'static_pages#help'
    get    'about'   => 'static_pages#about'
    get    'contact' => 'static_pages#contact'
  resources :users do
    member do
      get :following, :followers
    end
  end
  # users GET    /users(.:format)               users#index
  #              POST   /users(.:format)               users#create
  #     new_user GET    /users/new(.:format)           users#new
  #    edit_user GET    /users/:id/edit(.:format)      users#edit
  #         user GET    /users/:id(.:format)           users#show
  #              PATCH  /users/:id(.:format)           users#update
  #              PUT    /users/:id(.:format)           users#update
  #              DELETE /users/:id(.:format)           users#destroy
  # destroy_user DELETE /user/:id(.:format)            users#destroy
  # following_user GET    /users/:id/following(.:format) users#following
  # followers_user GET    /users/:id/followers(.:format) users#followers
  delete 'user/:id' => 'users#destroy', as: :destroy_user
  resources :groups do
    member do
      get :join, :leave
    end
  end
  # join_group GET    /groups/:id/join(.:format)     groups#join
  #  leave_group GET    /groups/:id/leave(.:format)    groups#leave
  #       groups GET    /groups(.:format)              groups#index
  #              POST   /groups(.:format)              groups#create
  #    new_group GET    /groups/new(.:format)          groups#new
  #   edit_group GET    /groups/:id/edit(.:format)     groups#edit
  #        group GET    /groups/:id(.:format)          groups#show
  #              PATCH  /groups/:id(.:format)          groups#update
  #              PUT    /groups/:id(.:format)          groups#update
  #              DELETE /groups/:id(.:format)          groups#destroy
  resources :profiles
  # profiles GET    /profiles(.:format)            profiles#index
  #              POST   /profiles(.:format)            profiles#create
  #  new_profile GET    /profiles/new(.:format)        profiles#new
  # edit_profile GET    /profiles/:id/edit(.:format)   profiles#edit
  #      profile GET    /profiles/:id(.:format)        profiles#show
  #              PATCH  /profiles/:id(.:format)        profiles#update
  #              PUT    /profiles/:id(.:format)        profiles#update
  #              DELETE /profiles/:id(.:format)        profiles#destroy
  get '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
  # sessions POST   /sessions(.:format)            sessions#create
  # new_session GET    /sessions/new(.:format)        sessions#new
  resources :microposts,          only: [:create, :destroy]
  #microposts POST   /microposts(.:format)          microposts#create
  #micropost DELETE /microposts/:id(.:format)      microposts#destroy
  resources :relationships,       only: [:create, :destroy]
  #relationships POST   /relationships(.:format)       relationships#create
  #relationship DELETE /relationships/:id(.:format)   relationships#destroy

end
