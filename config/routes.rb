Puzzle::Application.routes.draw do


  resources :producttypes

  resources :sanitations

  resources :suppliers

  resources :ContractsController

  resources :prices

  resources :items

  resources :first

  resources :insurance_companies

  resources :products

  resources :clients
  
  resources :contracts

  resources :orders

  #resources :searches
  
  root :to => 'first#index'
  
  root :to => 'home#index', :as => 'home'

  #root :to => 'products#update', :as => 'update'

  devise_for :users

  match '/contract_valid',                 :to => 'contracts#contract_valid',            :as => 'contract_valid'
  match '/sanitation_valid',                 :to => 'sanitations#sanitation_valid',            :as => 'sanitation_valid'
  
  devise_scope :users do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :users, :controller => "users"

  match "/get_price_on_select" => "products#get_price_on_select"
  match "/get_selling_price_on_select" => "contracts#get_selling_price_on_select"

  match "/get_client_address" => "sanitations#get_client_address"

  #match "/income_report" => "clients#income_report"

  match "client/income_report", :to => 'clients#income_report', :as => :client_report

  match '/expired_sanitations', :to => 'sanitations#expired_sanitations', :as => :expired_sanitations


  #devise_for :users, :controllers => {:users => "users"}

  #devise_scope :users do
  #  get "/users/new" => "devise/sessions#new"
  #end
  #devise_for :users do
  #  get "/", :to => "devise/sessions#new"
  #  root :to => "devise#new"
  #end

  #root :to => "devise/sessions#new"

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
