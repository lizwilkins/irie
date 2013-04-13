Irie::Application.routes.draw do
  resources :buses
  resources :routes, :except => [:show]
  root :to => 'routes#index'

end
