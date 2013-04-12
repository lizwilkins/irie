Irie::Application.routes.draw do
  resources :routes, :except => [:show]
  root :to => 'routes#index'
end
