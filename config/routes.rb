Irie::Application.routes.draw do

  resources :routes, :except => [:show]   # why no "show" path???
  resources :users, :except => [:show]
  resources :sessions 
  resources :trips
  resources :passengers
  resources :buses
  resources :drivers
  resources :riders

  match 'trips/:id/select_passenger' => 'trips#select_passenger', :as => :select_passenger
  match 'trips/:id/add_passenger' => 'trips#add_passenger', :as => :add_passenger, :via => :put

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  root :to => "home#index" #root can be anything, but must be present for devise gem.  

 # devise_for :rocketeers, :controllers => { :sessions => "sessions" }

  # devise_for :rocketeers, :controllers => { :registrations => "registrations" }

  # resources :rocketeers, :only => [:index, :show]

  # match 'home' => 'rocketeers#show'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
