Irie::Application.routes.draw do
  resources :buses
  resources :routes, :except => [:show]
  resources :users, :except => :show
  resources :sessions
  resources :trips
  resources :passengers
  resources :drivers
  resources :riders

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # devise_for :rocketeers, :controllers => { :sessions => "sessions" }

  # devise_for :rocketeers, :controllers => { :registrations => "registrations" }

  # resources :rocketeers, :only => [:index, :show]

  # match 'home' => 'rocketeers#show'

  root :to => "users#index" #root can be anything, but must be present for devise gem.  

  # The priority is based upon order of creation:
  # first created -> highest priority.

end
